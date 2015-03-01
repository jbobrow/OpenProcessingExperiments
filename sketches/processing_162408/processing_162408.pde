
import wordcram.*;

PFont Calibri= createFont("Calibri", 1);
PFont Century= createFont("Century", 1);
PFont Copperplate= createFont("Copperplate", 1);
PFont CurlzMT= createFont("CurlzMT", 1);
PFont Desdemona= createFont("Desdemona", 1);

size(600, 350);
background(255);

new WordCram(this)
.fromTextFile("bad.txt")
.fromTextFile("feelin.txt")
.fromTextFile("bartender.txt")
.fromTextFile("mama.txt")
.fromTextFile("river.txt")
.withStopWords("the, a, and, to, so, it")
.withFonter(Fonters.pickFrom(Calibri, Century, Copperplate, CurlzMT, Desdemona))
.withColorer(Colorers.pickFrom(#AA0000,#00AA00,#0000AA,#AA00AA,#00AAAA))
.drawAll();


