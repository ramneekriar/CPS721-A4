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

product(three_ft_hdmi_cable, rocketfish, hdmi_cable, 10, 4.5).
product(macbook_pro, apple, laptop, 2000, 4.2).
product(dell_xps, dell, laptop, 1700, 4.1).
product(surfacebook, microsoft, laptop, 1200, 3.5).

product(samsung_tv, samsung, tv, 1500, 4).

product(hdmi_cord1, rocketfish, hdmi_cord, 13, 4).
product(hdmi_cord2, rocketfish, hdmi_cord, 9, 3).

product(three_ft_hdmi_cable, rocketfish, cable, 10, 4.5).

product(dell_monitor1, dell, monitor, 500, 4.3).
product(dell_monitor2, dell, monitor, 400, 4.3).

product(samsung_monitor, samsung, monitor, 600, 3.7).
product(apple_pro_display, apple, monitor, 2000, 4.7).

product(galaxy_tab_10, samsung, tablet, 400, 4.1).
product(ipad_pro, apple, tablet, 600, 5).
product(amazon_tablet, amazon, tablet, 300, 3.5).

%%%%%  ATOMIC: inStock
% Add the atomic propositions for inStock in this section
% inStock(ProductName, StoreName, Count).

inStock(macbook_pro, eaton_centre_computer_shack, 4).
inStock(macbook_pro, montreal_computer_shack, 4).

inStock(dell_xps, square_one_computer_shack, 1).

inStock(surfacebook, union_computer_shack, 10).
inStock(surfacebook, eaton_centre_computer_shack, 5).

inStock(samsung_tv, montreal_computer_shack, 80).

inStock(three_ft_hdmi_cable, montreal_computer_shack, 20).
inStock(three_ft_hdmi_cable, square_one_computer_shack, 2).

inStock(hdmi_cord1, eaton_centre_computer_shack, 3).
inStock(hdmi_cord2, eaton_centre_computer_shack, 3).

inStock(galaxy_tab_10, eaton_centre_computer_shack, 5).
inStock(galaxy_tab_10, square_one_computer_shack, 40).
inStock(galaxy_tab_10, montreal_computer_shack, 8).
inStock(galaxy_tab_10, brampton_computer_shack, 10).

inStock(ipad_pro, eaton_centre_computer_shack, 20).
inStock(ipad_pro, square_one_computer_shack, 7).
inStock(amazon_tablet, eaton_centre_computer_shack, 50).
inStock(amazon_tablet, brampton_computer_shack, 4).

inStock(dell_monitor1, eaton_centre_computer_shack, 1).
inStock(dell_monitor2, brampton_computer_shack, 4).
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
canShip(dell_xps, mississauga).

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

% ------------------------------------
% ----------- ARTICLES -----------
% ------------------------------------
article(a).
article(an).
article(any).
article(the).


% ------------------------------------
% ----------- COMMON NOUNS -----------
% ------------------------------------
common_noun(laptop, P) :- product(P, _, laptop, _, _).
common_noun(tablet, P) :- product(P, _, tablet, _, _).
common_noun(hdmi_cable, P) :- product(P, _, hdmi_cable, _, _).
common_noun(hdmi_cord, P) :- product(P, _, hdmi_cord, _, _).
common_noun(monitor,  P) :- product(P, _, monitor, _, _).
common_noun(tv, P) :- product(P, _, tv, _, _).
common_noun(cable, P) :- product(P, _, cable, _, _).

common_noun(product, P) :- product(P, _, _, _, _).
common_noun(rating, R) :- product(_, _, _, _, R).
common_noun(price, P) :- product(_, _, _, P, _).
common_noun(cost, P) :- product(_, _, _, P, _).
common_noun(stock, C) :- inStock(_, _, C).

common_noun(city, C) :- location(_, C).
common_noun(city, C) :- canShip(_, C).
common_noun(store, S) :- inStock(_, S, _).
common_noun(store, S) :- location(S, _).


% ------------------------------------
% ----------- PREPOSITIONS -----------
% ------------------------------------
preposition(with, Store, P) :- inStock(P, Store, _).
preposition(with, P, Rating) :- product(P, _, _, _, Rating).
preposition(with, P, Price) :- product(P, _, _, Price, _).

preposition(that_can_ship_to, P, City) :- canShip(P, City).

preposition(of, R, P) :- product(P,_,_,_,R).
preposition(of, Price, P) :- product(P,_,_,Price,_).
preposition(of, P, Price) :- product(P,_,_,Price,_).
preposition(of, Count, P) :- inStock(P,_,Count).

preposition(in, P, Store) :- inStock(P,Store,_).
preposition(in, Store, City) :- location(Store, City).

preposition(in_the_stock, P, Store) :- inStock(P,Store,_).
preposition(in_the_stock, Store, City) :- location(Store, City).

preposition(at, P, Store) :- inStock(P,Store,_).
preposition(at, Count, Store) :- inStock(_, Store, Count).
preposition(at, P, City) :- inStock(P,Store,_), location(Store,City).

preposition(between, LowerBound, UpperBound, P, P) :- product(P,_,_,Price,_), Price>=LowerBound, Price=<UpperBound.
preposition(between, LowerBound, UpperBound, P, P) :- product(P,_,_,_,R), R>=LowerBound, R=<UpperBound.

% ------------------------------------
% ----------- PROPER NOUNS -----------
% ------------------------------------
proper_noun(N) :- product(N,_,_,_,_).
proper_noun(N) :- product(_,N,_,_,_).
proper_noun(N) :- product(_,_,_,N,_).
proper_noun(N) :- product(_,_,_,_,N).
proper_noun(N) :- location(N,_).
proper_noun(N) :- location(_,N).
proper_noun(N) :- canShip(_,N).


% ------------------------------------
% ----------- ADJECTIVES -------------
% ------------------------------------
adjective(rated, P) :- product(P, _, _, _, R).
adjective(highly_rated, P) :- product(P, _, _, _, R), R >= 4.
adjective(medium_rated, P) :- product(P, _, _, _, R), R >= 2.5, R < 4.
adjective(lowly_rated, P) :- product(P, _, _, _, R), R < 2.5.

adjective(microsoft, M) :- product(M, microsoft, _, _, _).
adjective(samsung, M) :- product(M, samsung, _, _, _).
adjective(dell, M) :- product(M, dell, _, _, _).
adjective(apple, M) :- product(M, apple, _, _, _).
adjective(rocketfish, M) :- product(M, rocketfish, _, _, _).

adjective(expensive, P) :- product(P, _, Type, Price1, _), not (product(P2, _, Type, Price2, _), P = P2, Price is Price1*2, Price < Price2).

adjective(cheapest, P) :- product(P, _, Type, Price1, _), not (product(P2, _, Type, Price2, _), Price2 < Price1).

% Added this extra
adjective(cheapest, Brand, Product) :- product(Product, Brand, Type, Price1, _), not (product(_, Brand, Type, Price2, _), Price2 < Price1).

%%%%% EXTRA LANGUAGE FEATURES
% Put the extra language features for question 4 in this section


%%%%% PARSER
what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).
np([Art|Rest], What) :- article(Art), np2(Rest, What).

% Added this
np([the|Rest], What) :- np2(Rest, What), not (np2(Rest, Other), not What=Other).

/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

np2([Adj|Rest],What) :- adjective(Adj,What), np2(Rest, What).

% Added this
np2([Adj, Ref|Rest], What) :- adjective(Adj, Ref, What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).


/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods([in, the, stock | Rest], What) :- mods(Rest, What).
mods([in, stock | Rest], What) :- mods(Rest, What).
mods(Words, What) :-
    not Words = [in, the, stock | _], not Words = [in, stock | _],
    appendLists(Start, End, Words),
    prepPhrase(Start, What),    mods(End, What).

prepPhrase([Prep|Rest], What) :-
	preposition(Prep, What, Ref), np(Rest, Ref).

% Added this
prepPhrase([between, X, and, Y], What) :- number(X), number(Y), preposition(between, X, Y, What, Other).

appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW