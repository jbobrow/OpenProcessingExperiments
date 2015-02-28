
PShape alimentacion;
boolean enviar;
int enviarop;
int enviarcont;
boolean fosters;
int fostersop;
int fosterscont;
boolean fridays;
int fridaysop;
int fridayscont;
boolean pans;
int pansop;
int panscont;
boolean cafete;
int cafeteop;
int cafetecont;
boolean vips;
int vipsop;
int vipscont;
boolean ginos;
int ginosop;
int ginoscont;
boolean telepi;
int telepiop;
int telepicont;
boolean hut;
int hutop;
int hutcont;
boolean burger;
int burgerop;
int burgercont;
boolean monta;
int montaop;
int montacont;
boolean kfc;
int kfcop;
int kfccont;
boolean starbucks;
int starbucksop;
int starbuckscont;
boolean llao;
int llaoop;
int llaocont;
boolean surena;
int surenaop;
int surenacont;
boolean donald;
int donaldop;
int donaldcont;
boolean rodilla;
int rodillaop;
int rodillacont;

void setup () {
  size (1000, 769);
  smooth();
  alimentacion = loadShape ("alimentacion.svg");
}

void draw() {
  background (255);
  shape (alimentacion, 0, 0, 1000, 769);

  fill(255, 255, 255, enviarop);
  noStroke();
  rect(460, 657, 92, 37);

  fill(255, 255, 255, fostersop);
  noStroke();
  rect(126, 220, 87, 90);

  fill(255, 255, 255, fridaysop);
  noStroke();
  rect(239, 227, 116, 77);

  fill(255, 255, 255, pansop);
  noStroke();
  rect(377, 225, 82, 82);

  fill(255, 255, 255, cafeteop);
  noStroke();
  rect(497, 231, 106, 67);

  fill(255, 255, 255, vipsop);
  noStroke();
  rect(639, 247, 125, 34);

  fill(255, 255, 255, ginosop);
  noStroke();
  rect(796, 247, 112, 40);

  fill(255, 255, 255, telepiop);
  noStroke();
  rect(162, 385, 126, 29);

  fill(255, 255, 255, hutop);
  noStroke();
  rect(324, 351, 90, 92);

  fill(255, 255, 255, burgerop);
  noStroke();
  rect(464, 354, 86, 87);

  fill(255, 255, 255, montaop);
  noStroke();
  rect(595, 363, 107, 69);

  fill(255, 255, 255, kfcop);
  noStroke();
  rect(748, 364, 114, 68);

  fill(255, 255, 255, starbucksop);
  noStroke();
  rect(115, 473, 100, 101);

  fill(255, 255, 255, llaoop);
  noStroke();
  rect(252, 498, 141, 41);

  fill(255, 255, 255, surenaop);
  noStroke();
  rect(435, 495, 127, 60);

  fill(255, 255, 255, donaldop);
  noStroke();
  rect(621, 483, 110, 83);

  fill(255, 255, 255, rodillaop);
  noStroke();
  rect(781, 506, 122, 42);
}

void mouseMoved () {

  if (mouseX >460 && mouseX <555 && mouseY >657 && mouseY <697) {
    enviar = true;
  }
  else {
    enviar = false;
  } 

  if (mouseX >126 && mouseX <213 && mouseY >220 && mouseY <311) {
    fosters = true;
  }
  else {
    fosters = false;
  } 

  if (mouseX >239 && mouseX <355 && mouseY >227 && mouseY <305) {
    fridays = true;
  }
  else {
    fridays = false;
  }

  if (mouseX >377 && mouseX <459 && mouseY >225 && mouseY <307) {
    pans = true;
  }
  else {
    pans = false;
  }
  if (mouseX >497 && mouseX <604 && mouseY >231 && mouseY <298) {
    cafete = true;
  }
  else {
    cafete = false;
  }
  if (mouseX >639 && mouseX <764 && mouseY >247 && mouseY <281) {
    vips = true;
  }
  else {
    vips = false;
  }
  if (mouseX >796 && mouseX <908 && mouseY >247 && mouseY <287) {
    ginos = true;
  }
  else {
    ginos = false;
  }
  if (mouseX >162 && mouseX <288 && mouseY >385 && mouseY <415) {
    telepi = true;
  }
  else {
    telepi = false;
  }
  if (mouseX >324 && mouseX <415 && mouseY >351 && mouseY <444) {
    hut = true;
  }
  else {
    hut = false;
  }
  if (mouseX >464 && mouseX <550 && mouseY >354 && mouseY <441) {
    burger = true;
  }
  else {
    burger = false;
  }
  if (mouseX >595 && mouseX <703 && mouseY >363 && mouseY <433) {
    monta = true;
  }
  else {
    monta = false;
  }
  if (mouseX >748 && mouseX <863 && mouseY >364 && mouseY <433) {
    kfc = true;
  }
  else {
    kfc = false;
  }
  if (mouseX >115 && mouseX <215 && mouseY >473 && mouseY <575) {
    starbucks = true;
  }
  else {
    starbucks = false;
  }
  if (mouseX >252 && mouseX <393 && mouseY >498 && mouseY <540) {
    llao = true;
  }
  else {
    llao = false;
  }
  if (mouseX >435 && mouseX <563 && mouseY >495 && mouseY <556) {
    surena = true;
  }
  else {
    surena = false;
  }
  if (mouseX >621 && mouseX <731 && mouseY >483 && mouseY <567) {
    donald = true;
  }
  else {
    donald = false;
  }
  if (mouseX >781 && mouseX <904 && mouseY >506 && mouseY <549) {
    rodilla = true;
  }
  else {
    rodilla = false;
  }

  if (enviar||fosters||fridays||pans||cafete||vips||ginos||telepi||hut||burger||monta||kfc||starbucks||llao||surena||donald||rodilla) {
    cursor( HAND);
  }
  else {
    cursor( ARROW);
  }
}

void mouseReleased() {
  if (enviar) {
    enviarop=150;
    enviarcont = enviarcont + 1;
  }

  if (fosters  && fostersop==0) {
    fostersop=150;
    fosterscont = fosterscont + 1;
  }
  if (fridays) {
    fridaysop=150;
    fridayscont = fridayscont + 1;
  }
  if (pans) {
    pansop=150;
    panscont = panscont + 1;
  }
  if (cafete) {
    cafeteop=150;
    cafetecont = cafetecont + 1;
  }
  if (vips) {
    vipsop=150;
    vipscont = vipscont + 1;
  }
  if (ginos) {
    ginosop=150;
    ginoscont = ginoscont + 1;
  }
  if (telepi) {
    telepiop=150;
    telepicont = telepicont + 1;
  }
  if (hut) {
    hutop=150;
    hutcont = hutcont + 1;
  }
  if (burger) {
    burgerop=150;
    burgercont = burgercont + 1;
  }
  if (monta) {
    montaop=150;
    enviarcont = enviarcont + 1;
  }
  if (kfc) {
    kfcop=150;
    kfccont = kfccont + 1;
  }
  if (starbucks) {
    starbucksop=150;
    starbuckscont = starbuckscont + 1;
  }
  if (llao) {
    llaoop=150;
    llaocont = llaocont + 1;
  }
  if (surena) {
    surenaop=150;
    surenacont = surenacont + 1;
  }
  if (donald) {
    donaldop=150;
    donaldcont = donaldcont + 1;
  }
  if (rodilla) {
    rodillaop=150;
    rodillacont = rodillacont + 1;
  }


  if (enviar && enviarcont==2 || enviarcont==4 || enviarcont==6 || enviarcont==8 || enviarcont==10 || enviarcont==12 || enviarcont==14) {
    enviarop=0;
  }

  if (fosters && fosterscont==2 || fosterscont==4 || fosterscont==6 || fosterscont==8 || fosterscont==10 || fosterscont==12 || fosterscont==14) {
    fostersop=0;
  }

  if (fridays && fridayscont==2 || fridayscont==4 || fridayscont==6 || fridayscont==8 || fridayscont==10 || fridayscont==12 || fridayscont==14) {
    fridaysop=0;
  }

  if (pans && panscont==2 || panscont==4 || panscont==6 || panscont==8 || panscont==10 || panscont==12 || panscont==14) {
    pansop=0;
  }

  if (cafete && cafetecont==2 || cafetecont==4 || cafetecont==6 || cafetecont==8 || cafetecont==10 || cafetecont==12 || cafetecont==14) {
    cafeteop=0;
  }

  if (vips && vipscont==2 || vipscont==4 || vipscont==6 || vipscont==8 || vipscont==10 || vipscont==12 || vipscont==14) {
    vipsop=0;
  }

  if (ginos && ginoscont==2 || ginoscont==4 ||ginoscont==6 || ginoscont==8 || ginoscont==10 ||ginoscont==12 || ginoscont==14) {
    ginosop=0;
  }

  if (telepi && telepicont==2 || telepicont==4 ||telepicont==6 || telepicont==8 || telepicont==10 ||telepicont==12 || telepicont==14) {
    telepiop=0;
  }

  if (hut && hutcont==2 || hutcont==4 ||hutcont==6 || hutcont==8 || hutcont==10 ||hutcont==12 || hutcont==14) {
    hutop=0;
  }

  if (burger && burgercont==2 || burgercont==4 || burgercont==6 || burgercont==8 || burgercont==10 || burgercont==12 || burgercont==14) {
    burgerop=0;
  }

  if (monta && montacont==2 || montacont==4 || montacont==6 || montacont==8 || montacont==10 || montacont==12 || montacont==14) {
    montaop=0;
  }

  if (kfc && kfccont==2 || kfccont==4 || kfccont==6 ||kfccont==8 || kfccont==10 || kfccont==12 || kfccont==14) {
    kfcop=0;
  }

  if (starbucks && starbuckscont==2 || starbuckscont==4 || starbuckscont==6 || starbuckscont==8 || starbuckscont==10 || starbuckscont==12 || starbuckscont==14) {
    starbucksop=0;
  }

  if (llao && llaocont==2 || llaocont==4 || llaocont==6 || llaocont==8 || llaocont==10 || llaocont==12 || llaocont==14) {
    llaoop=0;
  }

  if (surena && surenacont==2 || surenacont==4 || surenacont==6 || surenacont==8 || surenacont==10 || surenacont==12 || surenacont==14) {
    surenaop=0;
  }

  if (donald && donaldcont==2 || donaldcont==4 || donaldcont==6 || donaldcont==8 || donaldcont==10 || donaldcont==12 || donaldcont==14) {
    donaldop=0;
  }

  if (rodilla && rodillacont==2 || rodillacont==4 || rodillacont==6 || rodillacont==8 || rodillacont==10 || rodillacont==12 || rodillacont==14) {
    rodillaop=0;
  }


  if (enviar && donaldop==150) {
    link("http://consumingthem.tumblr.com/", "_new");
  }
}



