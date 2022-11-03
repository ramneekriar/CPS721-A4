% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Karanvir Heer
%%%%% NAME: Ramneek Riar
%%%%% NAME: Shruti Sharma
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC: product
% Add the atomic propositions for product in this section
% product(ProductName, Manufacturer, Type, Price, Rating).

product(macbook_pro, apple, laptop, 2000, 4.2).
product(dell_xps, dell, laptop, 1700, 4.1).
product(surfacebook, microsoft, laptop, 1200, 3.5).

product(samsung_tv, samsung, tv, 1500, 4).

product(three_ft_hdmi_cable, cable_guys, cable, 10, 4.5).

product(dell_monitor, dell, monitor, 500, 4.3).
product(samsung_monitor, samsung, monitor, 600, 3.7).
product(apple_pro_display, apple, monitor, 2000, 4.7).

product(galaxy_tab_10, samsung, tablet, 400, 4.1).
product(ipad_pro, apple, tablet, 600, 5).
product(amazon_tablet, amazon, tablet, 300, 3.5).

%%%%%  ATOMIC: inStock
% Add the atomic propositions for inStock in this section
% inStock(ProductName, StoreName, Count).

inStock(macbook_pro, eaton_centre_computer_shack, 3).
inStock(dell_xps, square_one_computer_shack, 1).
inStock(surfacebook, heartland_computer_shack, 0).
inStock(surfacebook, union_computer_shack, 10).
inStock(surfacebook, eaton_centre_computer_shack, 5).

inStock(samsung_tv, montreal_computer_shack, 10).

inStock(three_ft_hdmi_cable, montreal_computer_shack, 20).
inStock(three_ft_hdmi_cable, heartland_computer_shack, 0).
inStock(three_ft_hdmi_cable, square_one_computer_shack, 2).

inStock(galaxy_tab_10, square_one_computer_shack, 0).
inStock(galaxy_tab_10, eaton_centre_computer_shack, 5).
inStock(galaxy_tab_10, brampton_computer_shack, 10).

inStock(ipad_pro, eaton_centre_computer_shack, 20).
inStock(ipad_pro, square_one_computer_shack, 7).
inStock(amazon_tablet, eaton_centre_computer_shack, 50).
inStock(amazon_tablet, brampton_computer_shack, 4).

inStock(dell_monitor, eaton_centre_computer_shack, 1).
inStock(samsung_monitor, square_one_computer_shack, 10).
inStock(apple_pro_display, eaton_centre_computer_shack, 20).

%%%%% ATOMIC: location
% Add the atomic propositions for location in this section
% location(StoreName, City).

location(brampton_computer_shack, brampton).

location(montreal_computer_shack, montreal).

location(square_one_computer_shack, mississauga).
location(heartland_computer_shack, mississauga).

location(eaton_centre_computer_shack, toronto).
location(union_computer_shack, toronto).

%%%%% ATOMIC: canShip
% Add the atomic propositions for canShip in this section
% canShip(ProductName, City).

canShip(macbook_pro, toronto).
canShip(macbook_pro, mississauga).

canShip(dell_xps, brampton).

canShip(three_ft_hdmi_cable, montreal).
canShip(three_ft_hdmi_cable, brampton).

canShip(galaxy_tab_10, brampton).
canShip(galaxy_tab_10, mississauga).
canShip(galaxy_tab_10, toronto).

canShip(dell_monitor, toronto).
canShip(samsung_monitor, toronto).
canShip(apple_pro_display, toronto).

canShip(dell_monitor, brampton).
canShip(samsung_monitor, montreal).
canShip(apple_pro_display, mississauga).

%%%%% LEXICON
% Add the lexicon to this section


%%%%% EXTRA LANGUAGE FEATURES
% Put the extra language features for question 4 in this section


%%%%% PARSER
what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).
np([Art|Rest], What) :- article(Art), np2(Rest, What).


/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

np2([Adj|Rest],What) :- adjective(Adj,What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).


/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods(Words, What) :-
	appendLists(Start, End, Words),
	prepPhrase(Start, What),	mods(End, What).

prepPhrase([Prep|Rest], What) :-
	preposition(Prep, What, Ref), np(Rest, Ref).

appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
