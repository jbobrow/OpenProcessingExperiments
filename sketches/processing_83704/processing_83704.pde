
///variables
//venus
int metis = 40;
int io= 3630;
int europa= 3138;
int ganymede= 5262;
int callisto= 4800;
int leda= 16;
int himalia= 186;
int lysithia= 36;
int elara= 76;
int ananke= 30;
int carme= 40;
int pasiphae= 50;
int sinope= 36;

//saturn
int mimas= 392;
int enceladus= 520;
int tethys= 1060;
int dione = 1120;
int rhea = 1530;
int titan= 5150;
int iapetus= 1460;
int pheobe= 220;

//uranus
int cordelia= 26;
int ophelia= 30;
int bianca= 42;
int juliet= 62;
int desdemona= 54;
int rosalind= 84;
int portia=108;
int cressida= 54;
int belinda=66;
int puck= 154;
int miranda= 472;
int ariel= 1158;
int umbriel= 1172;
int titania= 1580;
int oberon= 1534;

//neptune
int naiad= 54;
int thalassa= 80;
int despina= 180;
int galatea= 150;
int larissa= 190;
int proteus= 400;
int triton= 2700;
int nereid= 340;




PImage total;
//venus
PImage metis1;
PImage io1;
PImage europa1;
PImage ganymede1;
PImage callisto1;
PImage leda1;
PImage himalia1;
PImage lysithia1;
PImage elara1;
PImage ananke1;
PImage carme1;
PImage pasiphae1;
PImage sinope1;

//Saturn
PImage mimas1;
PImage enceladus1;
PImage tethys1;
PImage dione1;
PImage rhea1;
PImage titan1;
PImage iapetus1;
PImage pheobe1;

//uranus
PImage cordelia1;
PImage ophelia1;
PImage bianca1;
PImage juliet1;
PImage desdemona1;
PImage rosalind1;
PImage portia1;
PImage cressida1;
PImage belinda1;
PImage puck1;
PImage miranda1;
PImage ariel1;
PImage umbriel1;
PImage titania1;
PImage oberon1;

//neptune
PImage naiad1;
PImage thalassa1;
PImage despina1;
PImage galatea1;
PImage larissa1;
PImage proteus1;
PImage triton1;
PImage nereid1;


boolean overAnanke = false;
boolean overAriel = false;
boolean overBelinda = false;
boolean overBianca = false;
boolean overCallisto = false;
boolean overCarme = false;
boolean overCordelia = false;
boolean overCressida = false;
boolean overDesdemona = false;
boolean overDespina = false;

boolean overDione = false;
boolean overElara = false;
boolean overEnceladus = false;
boolean overEuropa = false;
boolean overGalatea = false;
boolean overGanymede = false;
boolean overHimalia = false;
boolean overIapetus = false;
boolean overIo = false;
boolean overJuliet = false;

boolean overLarissa = false;
boolean overLeda = false;
boolean overLysithia = false;
boolean overMetis = false;
boolean overMimas = false;
boolean overMiranda = false;
boolean overNaiad = false;
boolean overNereid = false;
boolean overOberon = false;
boolean overOphelia = false;

boolean overPasiphae = false;
boolean overPheobe = false;
boolean overPortia = false;
boolean overProteus = false;
boolean overPuck = false;
boolean overRhea = false;
boolean overRosalind = false;
boolean overSinope = false;
boolean overTethys = false;
boolean overThalassa = false;

boolean overTitan = false;
boolean overTitania = false;
boolean overTriton = false;
boolean overUmbriel = false;

boolean overCircle = false;






void setup() {
  size(1200, 700);
  smooth();
  total = loadImage("Untitled-1-01.png");
  ananke1 = loadImage("ananke.png");
  ariel1 = loadImage("ariel.png");
  belinda1 = loadImage("belinda.png");
  bianca1 = loadImage("bianca.png");
  callisto1 = loadImage("callisto.png");
  carme1 = loadImage("carme.png");
  cordelia1 = loadImage("cordelia.png");
  cressida1 = loadImage("cressida.png");
  desdemona1 = loadImage("desdemona.png");
  despina1 = loadImage("despina.png");

  dione1 = loadImage("dione.png");
  elara1 = loadImage("elara.png");
  enceladus1 = loadImage("enceladus.png");
  europa1 = loadImage("europa.png");
  galatea1 = loadImage("galatea.png");
  ganymede1 = loadImage("ganymede.png");
  himalia1 = loadImage("himalia.png");
  iapetus1 = loadImage("iapetus.png");
  io1 = loadImage("io.png");
  juliet1 = loadImage("juliet.png");

  larissa1 = loadImage("larissa.png");
  leda1 = loadImage("leda.png");
  lysithia1 = loadImage("lysithia.png");
  metis1 = loadImage("metis.png");
  mimas1 = loadImage("mimas.png");
  miranda1 = loadImage("miranda.png");
  naiad1 = loadImage("naiad.png");
  nereid1 = loadImage("nereid.png");
  oberon1 = loadImage("oberon.png");
  ophelia1 = loadImage("ophelia.png");

  pasiphae1 = loadImage("pasiphae.png");
  pheobe1 = loadImage("pheobe.png");
  portia1 = loadImage("portia.png");
  proteus1 = loadImage("proteus.png");
  puck1 = loadImage("puck.png");
  rhea1 = loadImage("rhea.png");
  rosalind1 = loadImage("rosalind.png");
  sinope1 = loadImage("sinope.png");
  tethys1 = loadImage("tethys.png");
  thalassa1 = loadImage("thalassa.png");

  titan1 = loadImage("titan.png");
  titania1 = loadImage("titania.png");
  triton1 = loadImage("triton.png");
  umbriel1 = loadImage("umbriel.png");
};//end of setup


void draw() {
  image(total, 0, 0);
  
  
  ///////////////////////////////////////////////////////////////////////////Venusmoons
  if (dist(312, 70, mouseX, mouseY) < 10) {
  overMetis= true;
}else {
  overMetis =false;};
  if ((overMetis==true)) {
    image(total, 0, 0);
  image(metis1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, metis/10, metis/10);};


  if (dist(286, 124, mouseX, mouseY) < 10) {
  overAnanke= true;
}else {
  overAnanke =false;};
  if ((overAnanke==true)) {
    image(total, 0, 0);
  image(ananke1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, ananke/10, ananke/10);};
  
  
    if (dist(210, 81, mouseX, mouseY) < 10) {
  overCallisto= true;
}else {
  overCallisto =false;};
  if ((overCallisto==true)) {
    image(total, 0, 0);
  image(callisto1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, callisto/20, callisto/20);};
  
  
      if (dist(50, 293, mouseX, mouseY) < 10) {
  overCarme= true;
}else {
  overCarme =false;};
  if ((overCarme==true)) {
    image(total, 0, 0);
  image(carme1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, carme/10, carme/10);};
  
  
        if (dist(268, 190, mouseX, mouseY) < 10) {
  overElara= true;
}else {
  overElara =false;};
  if ((overElara==true)) {
    image(total, 0, 0);
  image(elara1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, elara/10, elara/10);};


        if (dist(175, 151, mouseX, mouseY) < 10) {
  overEuropa= true;
}else {
  overEuropa =false;};
  if ((overEuropa==true)) {
    image(total, 0, 0);
  image(europa1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, europa/20, europa/20);};
  
  
          if (dist(206, 186, mouseX, mouseY) < 10) {
  overGanymede= true;
}else {
  overGanymede =false;};
  if ((overGanymede==true)) {
    image(total, 0, 0);
  image(ganymede1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, ganymede/20, ganymede/20);};
  
  
            if (dist(209, 226, mouseX, mouseY) < 10) {
  overHimalia= true;
}else {
  overHimalia =false;};
  if ((overHimalia==true)) {
    image(total, 0, 0);
  image(himalia1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, himalia/10, himalia/10);};
  
  
              if (dist(156, 235, mouseX, mouseY) < 10) {
  overIo= true;
}else {
  overIo =false;};
  if ((overIo==true)) {
    image(total, 0, 0);
  image(io1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, io/20, io/20);};
  
  
              if (dist(294, 230, mouseX, mouseY) < 10) {
  overLeda= true;
}else {
  overLeda =false;};
  if ((overLeda==true)) {
    image(total, 0, 0);
  image(leda1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, leda/5, leda/5);};
  
  
               if (dist(103, 157, mouseX, mouseY) < 10) {
  overLysithia= true;
}else {
  overLysithia =false;};
  if ((overLysithia==true)) {
    image(total, 0, 0);
  image(lysithia1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, lysithia/10, lysithia/10);};
  
  
  
               if (dist(68, 246, mouseX, mouseY) < 10) {
  overPasiphae= true;
}else {
  overPasiphae =false;};
  if ((overPasiphae==true)) {
    image(total, 0, 0);
  image(pasiphae1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, pasiphae/5, pasiphae/5);};
  
  
  
               if (dist(124, 290, mouseX, mouseY) < 10) {
  overSinope= true;
}else {
  overSinope =false;};
  if ((overSinope==true)) {
    image(total, 0, 0);
  image(sinope1, width/2 -50, height/2 +200);
  fill(39, 170, 225);
  ellipse (width/2, height/2, sinope/5, sinope/5);};
  
  
  
  
  /////////////////////////////////////////////////////////////////////////////Saturn
  
                 if (dist(183, 499, mouseX, mouseY) < 10) {
  overDione= true;
}else {
  overDione =false;};
  if ((overDione==true)) {
    image(total, 0, 0);
  image(dione1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, dione/10, dione/10);};
  
  
                   if (dist(218, 542, mouseX, mouseY) < 10) {
  overEnceladus= true;
}else {
  overEnceladus =false;};
  if ((overEnceladus==true)) {
    image(total, 0, 0);
  image(enceladus1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, enceladus/10, enceladus/10);};
  
  
  
                   if (dist(263, 618, mouseX, mouseY) < 10) {
  overIapetus= true;
}else {
  overIapetus =false;};
  if ((overIapetus==true)) {
    image(total, 0, 0);
  image(iapetus1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, iapetus/10, iapetus/10);};
  
  
  
                   if (dist(164, 654, mouseX, mouseY) < 10) {
  overMimas= true;
}else {
  overMimas =false;};
  if ((overMimas==true)) {
    image(total, 0, 0);
  image(mimas1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, mimas/10, mimas/10);};
  
                   if (dist(181, 602, mouseX, mouseY) < 10) {
  overPheobe= true;
}else {
  overPheobe =false;};
  if ((overPheobe==true)) {
    image(total, 0, 0);
  image(pheobe1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, pheobe/10, pheobe/10);};
  
  
  
                   if (dist(135, 573, mouseX, mouseY) < 10) {
  overRhea= true;
}else {
  overRhea =false;};
  if ((overRhea==true)) {
    image(total, 0, 0);
  image(rhea1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, rhea/10, rhea/10);};
  
                   if (dist(75, 558, mouseX, mouseY) < 10) {
  overTethys= true;
}else {
  overTethys =false;};
  if ((overTethys==true)) {
    image(total, 0, 0);
  image(tethys1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, tethys/10, tethys/10);};
  
                   if (dist(92, 506, mouseX, mouseY) < 10) {
  overTitan= true;
}else {
  overTitan =false;};
  if ((overTitan==true)) {
    image(total, 0, 0);
  image(titan1, width/2 -50, height/2 +200);
  fill(43, 182, 115);
  ellipse (width/2, height/2, titan/20, titan/20);};
  
  /////////////////////////////////////////////////////////////////////////////////Neptune
  
                     if (dist(1131, 492, mouseX, mouseY) < 10) {
  overDespina= true;
}else {
  overDespina =false;};
  if ((overDespina==true)) {
    image(total, 0, 0);
  image(despina1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, despina/10, despina/10);};
  
  
                       if (dist(1122, 555, mouseX, mouseY) < 10) {
  overGalatea= true;
}else {
  overGalatea =false;};
  if ((overGalatea==true)) {
    image(total, 0, 0);
  image(galatea1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, galatea/10, galatea/10);};
  
  
                       if (dist(1084, 511, mouseX, mouseY) < 10) {
  overLarissa= true;
}else {
  overLarissa =false;};
  if ((overLarissa==true)) {
    image(total, 0, 0);
  image(larissa1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, larissa/10, larissa/10);};
  
  
                       if (dist(1058, 562, mouseX, mouseY) < 10) {
  overNaiad= true;
}else {
  overNaiad =false;};
  if ((overNaiad==true)) {
    image(total, 0, 0);
  image(naiad1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, naiad/10, naiad/10);};
  
  
                       if (dist(1044, 488, mouseX, mouseY) < 10) {
  overNereid= true;
}else {
  overNereid =false;};
  if ((overNereid==true)) {
    image(total, 0, 0);
  image(nereid1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, nereid/10, nereid/10);};
  
  
                       if (dist(1002, 533, mouseX, mouseY) < 10) {
  overProteus= true;
}else {
  overProteus =false;};
  if ((overProteus==true)) {
    image(total, 0, 0);
  image(proteus1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, proteus/10, proteus/10);};
  
  
                       if (dist(1004, 582, mouseX, mouseY) < 10) {
  overThalassa= true;
}else {
  overThalassa =false;};
  if ((overThalassa==true)) {
    image(total, 0, 0);
  image(thalassa1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, thalassa/10, thalassa/10);};
  
  
                       if (dist(991, 640, mouseX, mouseY) < 10) {
  overTriton= true;
}else {
  overTriton =false;};
  if ((overTriton==true)) {
    image(total, 0, 0);
  image(triton1, width/2 -50, height/2 +200);
  fill(220, 96, 105);
  ellipse (width/2, height/2, triton/20, triton/20);};
  
  //////////////////////////////////////////////////////////////////////////////////////Uranus
  
                         if (dist(963, 67, mouseX, mouseY) < 10) {
  overAriel= true;
}else {
  overAriel =false;};
  if ((overAriel==true)) {
    image(total, 0, 0);
  image(ariel1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, ariel/14, ariel/14);};
  
  
                           if (dist(912, 77, mouseX, mouseY) < 10) {
  overBelinda= true;
}else {
  overBelinda =false;};
  if ((overBelinda==true)) {
    image(total, 0, 0);
  image(belinda1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, belinda/10, belinda/10);};
  
  
                           if (dist(878, 80, mouseX, mouseY) < 10) {
  overBianca= true;
}else {
  overBianca =false;};
  if ((overBianca==true)) {
    image(total, 0, 0);
  image(bianca1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, bianca/10, bianca/10);};
  
  
                           if (dist(839, 141, mouseX, mouseY) < 10) {
  overCordelia= true;
}else {
  overCordelia =false;};
  if ((overCordelia==true)) {
    image(total, 0, 0);
  image(cordelia1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, cordelia/10, cordelia/10);};
  
  
                           if (dist(898, 148, mouseX, mouseY) < 10) {
  overCressida= true;
}else {
  overCressida =false;};
  if ((overCressida==true)) {
    image(total, 0, 0);
  image(cressida1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, cressida/10, cressida/10);};
  
  
                           if (dist(857, 228, mouseX, mouseY) < 10) {
  overDesdemona= true;
}else {
  overDesdemona =false;};
  if ((overDesdemona==true)) {
    image(total, 0, 0);
  image(desdemona1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, desdemona/10, desdemona/10);};
  
  
                           if (dist(925, 192, mouseX, mouseY) < 10) {
  overJuliet= true;
}else {
  overJuliet =false;};
  if ((overJuliet==true)) {
    image(total, 0, 0);
  image(juliet1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, juliet/10, juliet/10);};
  
  
                           if (dist(973, 190, mouseX, mouseY) < 10) {
  overMiranda= true;
}else {
  overMiranda =false;};
  if ((overMiranda==true)) {
    image(total, 0, 0);
  image(miranda1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, miranda/10, miranda/10);};
  
  
                           if (dist(1048, 187, mouseX, mouseY) < 10) {
  overOberon= true;
}else {
  overOberon =false;};
  if ((overOberon==true)) {
    image(total, 0, 0);
  image(oberon1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, oberon/14, oberon/14);};
  
  
                           if (dist(908, 275, mouseX, mouseY) < 10) {
  overOphelia= true;
}else {
  overOphelia =false;};
  if ((overOphelia==true)) {
    image(total, 0, 0);
  image(ophelia1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, ophelia/10, ophelia/10);};
  
  
                           if (dist(964, 252, mouseX, mouseY) < 10) {
  overPortia= true;
}else {
  overPortia =false;};
  if ((overPortia==true)) {
    image(total, 0, 0);
  image(portia1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, portia/10, portia/10);};
  
  
                           if (dist(948, 307, mouseX, mouseY) < 10) {
  overPuck= true;
}else {
  overPuck =false;};
  if ((overPuck==true)) {
    image(total, 0, 0);
  image(puck1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, puck/10, puck/10);};
  
  
                           if (dist(1018, 298, mouseX, mouseY) < 10) {
  overRosalind= true;
}else {
  overRosalind =false;};
  if ((overRosalind==true)) {
    image(total, 0, 0);
  image(rosalind1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, rosalind/10, rosalind/10);};
  
  
                           if (dist(1068, 289, mouseX, mouseY) < 10) {
  overTitania= true;
}else {
  overTitania =false;};
  if ((overTitania==true)) {
    image(total, 0, 0);
  image(titania1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, titania/14, titania/14);};
  
  
                           if (dist(986, 354, mouseX, mouseY) < 10) {
  overUmbriel= true;
}else {
  overUmbriel =false;};
  if ((overUmbriel==true)) {
    image(total, 0, 0);
  image(umbriel1, width/2 -50, height/2 +200);
  fill(251, 176, 64);
  ellipse (width/2, height/2, umbriel/14, umbriel/14);};

};//end of draw


