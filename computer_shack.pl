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

product(three_ft_hdmi_cable, rocketfish, cable, 10, 4.5).

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

article(a).
article(an).
article(any).
article(the).


common_noun(laptop, T) :- product(_, _, T, _, _).
common_noun(tablet, T) :- product(_, _, T, _, _).
common_noun(hdmi_cable,  T) :- product(_, _, T, _, _).
common_noun(hdmi_cord, T) :- product(_, _, T, _, _).
common_noun(monitor,  T) :- product(_, _, T, _, _).
common_noun(tv, T) :- product(_, _, T, _, _).
common_noun(cable, T) :- product(_, _, T, _, _).
common_noun(stock, C) :- inStock(_, _, C).
common_noun(rating, R) :- product(_, _, _, _, R).
common_noun(price, P) :- product(_, _, _, P, _).
common_noun(city, C) :- location(_, C).
common_noun(city, C) :- canShip(_, C).
common_noun(store, S) :- inStock(_, S, _).
common_noun(store, S) :- location(S, _).

preposition(in_the_stock, P, Store) :- inStock(P,Store,_).
preposition(in_the_stock, Store, City) :- location(Store, City).

preposition(in, P, Store) :- inStock(P,Store,_).
preposition(in, Store, City) :- location(Store, City).

preposition(at, P, Store) :- inStock(P,Store,_).
preposition(at, Count, Store) :- inStock(_, Store, Count).
preposition(at, P, City) :- inStock(P,Store,_), location(Store,City).

preposition(that_can_ship_to, P, City) :- canShip(P, City).

preposition(with, Store, P) :- inStock(P, Store, _).

preposition(of, R, P) :- product(P,_,_,_,R).
preposition(of, Count, P) :- inStock(P,_,Count).


% unsure about these 3
proper_noun(rating) :- product(_, _, _, _, R). 
proper_noun(price) :- product(_, _, _, P, _).
proper_noun(stock) :- inStock(_, _, C).

proper_noun(toronto) :- canShip(_, toronto).
proper_noun(toronto) :- location(_, toronto).

proper_noun(mississauga) :- canShip(_, mississauga).
proper_noun(mississauga) :- location(_, mississauga).

proper_noun(montreal) :- canShip(_, montreal).
proper_noun(montreal) :- location(_, montreal).

proper_noun(brampton) :- canShip(_, brampton).
proper_noun(brampton) :- location(_, brampton).

proper_noun(square_one_computer_shack) :- location(square_one_computer_shack, _).
proper_noun(square_one_computer_shack) :- inStock(_, square_one_computer_shack, _).

proper_noun(eaton_centre_computer_shack) :- location(eaton_centre_computer_shack, _).
proper_noun(eaton_centre_computer_shack) :- inStock(_, eaton_centre_computer_shack, _).

proper_noun(montreal_computer_shack) :- location(montreal_computer_shack, _).
proper_noun(montreal_computer_shack) :- inStock(_, montreal_computer_shack, _).

proper_noun(heartland_computer_shack) :- location(heartland_computer_shack, _).
proper_noun(heartland_computer_shack) :- inStock(_, heartland_computer_shack, _).

proper_noun(union_computer_shack) :- location(union_computer_shack, _).
proper_noun(union_computer_shack) :- inStock(_, union_computer_shack, _).

proper_noun(brampton_computer_shack) :- location(brampton_computer_shack, _).
proper_noun(brampton_computer_shack) :- inStock(_, brampton_computer_shack, _).

proper_noun(three_ft_hdmi_cable) :- inStock(three_ft_hdmi_cable, _, _).
proper_noun(three_ft_hdmi_cable) :- canShip(three_ft_hdmi_cable, _).
proper_noun(three_ft_hdmi_cable) :- product(three_ft_hdmi_cable, _, _, _, _).

proper_noun(galaxy_tab_10) :- inStock(galaxy_tab_10, _, _).
proper_noun(galaxy_tab_10) :- canShip(galaxy_tab_10, _).
proper_noun(galaxy_tab_10) :- product(galaxy_tab_10, _, _, _, _).

proper_noun(macbook_pro) :- inStock(macbook_pro, _, _).
proper_noun(macbook_pro) :- canShip(macbook_pro, _).
proper_noun(macbook_pro) :- product(macbook_pro, _, _, _, _).

proper_noun(dell_xps) :- inStock(dell_xps, _, _).
proper_noun(dell_xps) :- canShip(dell_xps, _).
proper_noun(dell_xps) :- product(dell_xps, _, _, _, _).

proper_noun(surfacebook) :- inStock(surfacebook, _, _).
proper_noun(surfacebook) :- canShip(surfacebook, _).
proper_noun(surfacebook) :- product(surfacebook, _, _, _, _).

proper_noun(samsung_tv) :- inStock(samsung_tv, _, _).
proper_noun(samsung_tv) :- canShip(samsung_tv, _).
proper_noun(samsung_tv) :- product(samsung_tv, _, _, _, _).

proper_noun(dell_monitor) :- inStock(dell_monitor, _, _).
proper_noun(dell_monitor) :- canShip(dell_monitor, _).
proper_noun(dell_monitor) :- product(dell_monitor, _, _, _, _).

proper_noun(samsung_monitor) :- inStock(samsung_monitor, _, _).
proper_noun(samsung_monitor) :- canShip(samsung_monitor, _).
proper_noun(samsung_monitor) :- product(samsung_monitor, _, _, _, _).

proper_noun(apple_pro_display) :- inStock(apple_pro_display, _, _).
proper_noun(apple_pro_display) :- canShip(apple_pro_display, _).
proper_noun(apple_pro_display) :- product(apple_pro_display, _, _, _, _).

proper_noun(ipad_pro) :- inStock(ipad_pro, _, _).
proper_noun(ipad_pro) :- canShip(ipad_pro, _).
proper_noun(ipad_pro) :- product(ipad_pro, _, _, _, _).

proper_noun(amazon_tablet) :- inStock(amazon_tablet, _, _).
proper_noun(amazon_tablet) :- canShip(amazon_tablet, _).
proper_noun(amazon_tablet) :- product(amazon_tablet, _, _, _, _).


% idk
adjective(expensive, Price).
adjective(cheapest, Price).

adjective(rated, R) :- product(_, _, _, _, R).
adjective(highly_rated, R) :- product(_, _, _, _, R), R >= 4.
adjective(medium_rated, R) :- product(_, _, _, _, R), R > 2, R < 4.
adjective(lowly_rated, R) :- product(_, _, _, _, R), R =< 2.

adjective(microsoft, M) :- product(_, M, _, _, _).
adjective(samsung, M) :- product(_, M, _, _, _).
adjective(dell, M) :- product(_, M, _, _, _).
adjective(apple, M) :- product(_, M, _, _, _).
adjective(rocketfish, M) :- product(_, M, _, _, _).



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
