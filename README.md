Trenutna inicializacija:

Vklopi utop

#require "graphics";;
#use "graphics.ml";;
#use "grafika.ml";;
#use "pravila.ml";;
#use "izlocisosede.ml";;

let nekamatrika = randommatrika 5 7;;

naredi_graf nekamatrika;;

narisimatriko nekamatrika;;

(*LOOP*)

let nekamatrika = korak izlocisosede nekamatrika;;

narisimatriko nekamatrika;;

(*konec LOOPa*)

zaprigraf();;

