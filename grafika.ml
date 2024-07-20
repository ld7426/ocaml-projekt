#require "graphics"

let naredi_graf matrika =
let m = Array.length matrika in
let n = Array.length matrika.(0) in
let sirina = n*100 in
let visina = m*100 in
let zacetnistring = " "^(string_of_int sirina) ^ "x" ^ (string_of_int visina) in
Graphics.open_graph zacetnistring

let zaprigraf = Graphics.close_graph

(*pazi, ker fill_rect gleda od spodaj gor namesto od zgoraj dol*)
let rec narisigrafpovrstici vrstica i j= (*tukaj je pomembno, da je vrstica list in ne array!!!*)
match vrstica with
| true::[] -> Graphics.fill_rect (i*100) (j*100) 100 100;
| true :: tail -> Graphics.fill_rect (i*100) (j*100) 100 100; narisigrafpovrstici tail (i+1) j
| false :: tail -> narisigrafpovrstici tail (i+1) j
| _ -> ()


let rec obrniseznam seznam =(*hkrati spremeni emelente iz Arraya v list*)
match seznam with
| head :: tail -> (obrniseznam tail) @ [Array.to_list head]
| [] -> []

let rec pomoznanarisiseznam seznam i j= (*Sprejme matriko v obliki list list in indeksa i in j*)
match seznam with
| head :: tail -> narisigrafpovrstici head i j; pomoznanarisiseznam tail i (j+1)
| [] -> ()

let narisimatriko matrika =
let seznam = obrniseznam (Array.to_list matrika) in
Graphics.clear_graph(); pomoznanarisiseznam seznam 0 0
