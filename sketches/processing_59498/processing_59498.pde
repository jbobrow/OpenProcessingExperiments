
import processing.pdf.*;
import controlP5.*;
ControlP5 controlP5;
float multiplier = 0.10;
Numberbox n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
controlP5.Button b;
Bang pdfbang;
Textlabel myTextlabelA;
PFont font;
boolean savePDF = false;
PGraphics other;

// MEASUREMENTS - BUST, WAIST, SHOULDER LENGTH, NAPE TO WAIS, NECK SIZE, BACK WIDTH, ARMSCYE DEPTH, CHEST WIDTH, BUST DART WIDTH

float n1val, n2val, n3val, n4val, n5val, n6val, n7val, n8val, n9val, n10val, n11val;
float valScayl = 8.099;
float halfval = valScayl/2;
float cmCon = 2.54;
int saveaspdf = 0;

PVector origin, ptA, ptB, ptC, ptD, ptE, ptF, ptG, ptH, ptI, ptJ, ptK, ptL, ptM, ptN, ptO, ptP, ptQ, ptR, ptS, ptT, ptU, ptV, ptW, ptX, ptY, ptZ, ptAA, ptAB;
PVector ptBP;
float ltrw = 8.5*cmCon*valScayl;
float ltrwmarg = 7.5*cmCon*valScayl;
float ltrh = 11*cmCon*valScayl;
float ltrhmarg = 10*cmCon*valScayl;

void setup(){
  size(750, 650);
  
  background(200);
  smooth();
  
  //other.createGraphics(int(ltrwmarg), int(ltrhmarg), P3D);
  controlP5 = new ControlP5(this);
  font = loadFont("Inconsolata-48.vlw");
  textFont(font, 12);
  fill(0);
  //controlP5.setControlFont(new ControlFont(createFont("Georgia",20), 20));
  myTextlabelA = controlP5.addTextlabel("label","BASIC BODICE BLOCK",18,10);
  myTextlabelA.setWidth(100);
  
  n1 = controlP5.addNumberbox("Bust", 100, 15, 30, 120, 14);
  n2 = controlP5.addNumberbox("Waist", 82, 15, 65, 120, 14);
  n3 = controlP5.addNumberbox("Shoulder Length", 12, 15, 100, 120, 14);
  n4 = controlP5.addNumberbox("Nape To Waist", 48, 15, 135, 120, 14);
  n5 = controlP5.addNumberbox("Neck Size", 39, 15, 170, 120, 14);
  n6 = controlP5.addNumberbox("Back Width", 30, 15, 205, 120, 14);
  n7 = controlP5.addNumberbox("Armscye Depth", 21, 15, 240, 120, 14);
  n8 = controlP5.addNumberbox("Chest Width", 30, 15, 275, 120, 14);
  n9 = controlP5.addNumberbox("Bust Dart Width", 7 + (n1.value()-88)*.15, 15, 310, 120, 14);
  n10 = controlP5.addNumberbox("Over Bust", 90, 15, 345, 120, 14);
  n11 = controlP5.addNumberbox("Under Bust", 90, 15, 380, 120, 14);
  
  //b = controlP5.addButton("Save as PDF", 0, 15, height-29, 120, 14);
  pdfbang = controlP5.addBang("bang", 15, height-40, 120, 14);
  pdfbang.setLabel("Export as PDF");
  
  n1.setMultiplier(multiplier); n2.setMultiplier(multiplier); n3.setMultiplier(multiplier);
  n4.setMultiplier(multiplier); n5.setMultiplier(multiplier); n6.setMultiplier(multiplier); 
  n7.setMultiplier(multiplier); n8.setMultiplier(multiplier); n9.setMultiplier(multiplier);
  n10.setMultiplier(multiplier); n11.setMultiplier(multiplier/2);
  
  n1.setMin(0); n2.setMin(0); n3.setMin(0); n4.setMin(0); n5.setMin(0); n6.setMin(0);
  n7.setMin(0); n8.setMin(0); n9.setMin(0); n10.setMin(0); n11.setMin(0);
}

void draw(){
  if (savePDF == true){
    String Date = year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".pdf";
    beginRecord(PDF, Date);
  }

  background(100);
  stroke(200);
  fill(255);
  rect(150, 0, 600, height);
  fill(200);

  drawGrid();
  setValues();
  
  pushMatrix();
  translate(150 + valScayl*5, valScayl*5);
  drawBodice();
  //translate(5*valScayl, n7val + valScayl*4.5);
  translate(5*valScayl, n4val + valScayl*15);
  drawBra();
  popMatrix();
  
  if (savePDF == true){
    println("saved pdf");
    savePDF = false;
    endRecord();
  }
  
  //rectMode(CENTER);
  //rect(mouseX, mouseY, ltrw, ltrh);
  //rect(mouseX, mouseY, ltrw-(cmCon*valScayl), ltrh-cmCon*valScayl);
  //rectMode(CORNER);
}

void bang(){
  savePDF = true;
}

void drawGrid(){
  for(int i=0; i<height/valScayl; i++){
    if (i%5 == 0){ strokeWeight(1); text(Integer.toString(i-5), 150, i*valScayl);} 
    else { strokeWeight(0.25); }
    line(150, i*valScayl, width, i*valScayl);
  }
  for(int i=0; i<(width-150)/valScayl; i++){
    if (i%5 == 0){ strokeWeight(1); text(Integer.toString(i-5), 150 + i*valScayl, valScayl); } 
    else { strokeWeight(0.25); }
    line(150 + i*valScayl, 0, 150 + i*valScayl, height);
  }
}

void setValues(){
  n9.setValue(7 + (n1.value()-88)*.15);
  n1val = valScayl*n1.value(); n2val = valScayl*n2.value(); n3val = valScayl*n3.value();
  n4val = valScayl*n4.value(); n5val = valScayl*n5.value(); n6val = valScayl*n6.value();
  n7val = valScayl*n7.value(); n8val = valScayl*n8.value(); n9val = valScayl*n9.value();
  n10val = valScayl*n10.value(); n11val = valScayl*n11.value();
}

void drawBodice(){
  stroke(0);
  fill(0);
  PVector origin = new PVector(0,0); text("origin", origin.x-valScayl, origin.y);
  PVector ptA = new PVector(0, 1.5 * valScayl); text("A", ptA.x-valScayl, ptA.y); // 1.5cm
  PVector ptB = new PVector(ptA.x, ptA.y + n7val + (.5*valScayl)); text("B", ptB.x-valScayl, ptB.y); // armscye
  PVector ptC = new PVector(ptB.x + n1val/2 + 5*valScayl, ptB.y); text("C", ptC.x, ptC.y); // half bust
  float dxtra;
  if (n1.value() > 92){dxtra = valScayl*(n1.value()-92)/8;} else { dxtra = 0; }
  PVector ptD = new PVector(ptC.x, ptC.y - n7val - 2*valScayl - dxtra); text("D", ptD.x, ptD.y); // armscye + 2cm
  PVector ptE = new PVector(origin.x, origin.y + n4val); text("E", ptE.x-valScayl, ptE.y); // nape to waist
  PVector ptF = new PVector(ptC.x, ptE.y); text("F", ptF.x, ptF.y); // squaring off E and C
  PVector ptG = new PVector(origin.x + n5val/5 - .2*valScayl, origin.y); text("G", ptG.x, ptG.y); // neck hole
  PVector ptH = new PVector(ptA.x, ptA.y + n7val/5 - .7*valScayl); text("H", ptH.x-valScayl, ptH.y); // 1/5 armscye - .7cm
  float shoulderRad = n3val + 1*valScayl;
  float ptIx = sqrt(shoulderRad*shoulderRad - ptH.y*ptH.y);
  PVector ptI = new PVector(ptG.x + ptIx, ptH.y); text("I", ptI.x, ptI.y); // shoulder
  PVector ptJ = new PVector((ptG.x+ptI.x)/2, (ptG.y+ptI.y)/2); text("J", ptJ.x, ptJ.y);
  float kjd = sqrt(sq(5*valScayl) + sq(1*valScayl));
  float gid = sqrt(sq(ptG.x-ptI.x) + sq(ptG.y-ptI.y));
  float gang = asin((ptJ.y-ptG.y)/(gid/2));
  float ptKx = ptJ.x - (kjd*sin(gang));
  float ptKy = ptJ.y + (kjd*cos(gang));
  PVector ptK = new PVector(ptKx, ptKy); text("K", ptK.x, ptK.y);
  //PVector ptK0 = new PVector(ptJ.x-valScayl, ptJ.y + 5*valScayl);
  PVector ptJd1 = new PVector(ptJ.x + (.5*valScayl)*cos(gang), ptJ.y + (.5*valScayl)*sin(gang));
  PVector ptJd2 = new PVector(ptJ.x - (.5*valScayl)*cos(gang), ptJ.y - (.5*valScayl)*sin(gang));
  PVector ptL = new PVector(ptB.x + n6val/2 + .5*valScayl, ptB.y); text("L", ptL.x, ptL.y);
  PVector ptM = new PVector(ptL.x, ptH.y); text("M", ptM.x, ptM.y);
  PVector ptN = new PVector(ptM.x, (ptM.y+ptL.y)/2); text("N", ptN.x, ptN.y);
  PVector ptP = new PVector((ptB.x+ptL.x)/2, ptB.y); text("P", ptP.x, ptP.y);
  PVector ptQ = new PVector(ptP.x, ptE.y); text("Q", ptQ.x, ptQ.y);
  float ptrd = n5val/5 - .7*valScayl;
  float doang = atan((origin.y-ptD.y)/(ptD.x-origin.x));
  float ptRx = ptrd*cos(doang);
  float ptRy = ptrd*sin(doang);
  PVector ptR = new PVector(ptD.x-ptRx, ptD.y+ptRy); text("R", ptR.x, ptR.y); text("R", ptR.x, ptR.y);
  PVector ptS = new PVector(ptD.x, ptD.y + n5val/5 - .2*valScayl); text("S", ptS.x, ptS.y);
  PVector ptT = new PVector(ptC.x - n8val/2 - n9val/2, ptC.y); text("T", ptT.x, ptT.y);
  PVector ptU = new PVector((ptT.x+ptC.x)/2, ptT.y); text("U", ptU.x, ptU.y);
  PVector ptV = new PVector(ptU.x, ptF.y); text("V", ptV.x, ptV.y);
  ptBP = new PVector(ptU.x, ptU.y + 2.5*valScayl); text("BP", ptBP.x, ptBP.y);
  ptW = new PVector(ptR.x - n9val*cos(doang), ptR.y + n9val*sin(doang)); text("W", ptW.x, ptW.y);
  float ptXydiff = (ptH.y - ptW.y) + 1.5*valScayl;
  float ptxx = sqrt(shoulderRad*shoulderRad - ptXydiff*ptXydiff);
  ptX = new PVector(ptW.x - ptxx, ptH.y+1.5*valScayl); text("X", ptX.x, ptX.y);
  PVector ptY = new PVector(ptT.x, ptT.y - n7val/3); text("Y", ptY.x, ptY.y);
  PVector ptZ = new PVector((ptL.x+ptT.x)/2, ptL.y); text("Z", ptZ.x, ptZ.y);
  PVector ptAA = new PVector(ptZ.x, ptE.y); text("AA", ptAA.x, ptAA.y);
  float Ldiaglen = ((n1.value()-88)*0.05 + 2.5)*valScayl;
  float Tdiaglen = Ldiaglen - (0.5*valScayl);
  PVector Ldiag = new PVector(ptL.x + Ldiaglen*cos(PI/4), ptL.y - Ldiaglen*sin(PI/4));
  PVector Tdiag = new PVector(ptT.x - Tdiaglen*cos(PI/4), ptT.y - Tdiaglen*sin(PI/4));
  PVector ptAB = new PVector(ptF.x, ptF.y + (((n1.value()-88)*0.05 + 1)*valScayl)); text("AB", ptAB.x, ptAB.y);
  float bustwaistdiff = n1.value() + 3 - n2.value();
  //println("diff= " + bustwaistdiff + ", waist + 6 = " + (n2.value()-6));
  float midDart = bustwaistdiff/3 * valScayl;
  float frontDart = midDart + 0.5*valScayl;
  float backDart = midDart - 0.5*valScayl;
  float ABang = atan((ptAB.y - ptF.y)/(ptF.x-ptE.x));
  PVector ptQ0 = new PVector(ptQ.x, ptQ.y + (tan(ABang)*(ptQ.x-ptE.x))); //text("Q0", ptQ0.x, ptQ0.y);
  PVector bkDtL = new PVector(ptQ0.x - backDart/2*cos(ABang), ptQ0.y - backDart/2*sin(ABang));
  PVector bkDtR = new PVector(ptQ0.x + backDart/2*cos(ABang), ptQ0.y + backDart/2*sin(ABang));
  PVector ptAA0 = new PVector(ptAA.x, ptAA.y + (tan(ABang)*(ptAA.x-ptE.x))); //text("AA0", ptAA0.x, ptAA0.y);
  PVector midDtL = new PVector(ptAA0.x - ((midDart/2)-(0.5*valScayl))*cos(ABang), ptAA0.y - ((midDart/2)-(0.5*valScayl))*sin(ABang));
  PVector midDtR = new PVector(ptAA0.x + ((midDart/2)+(0.5*valScayl))*cos(ABang), ptAA0.y + ((midDart/2)+(0.5*valScayl))*sin(ABang));
  PVector ptV0 = new PVector(ptV.x, ptV.y + (tan(ABang)*(ptV.x-ptE.x)));
  PVector frtDtL = new PVector(ptV0.x - frontDart/2*cos(ABang), ptV0.y - frontDart/2*sin(ABang));
  PVector frtDtR = new PVector(ptV0.x + frontDart/2*cos(ABang), ptV0.y + frontDart/2*sin(ABang));
  
  noFill();
    strokeWeight(1);
  line(origin.x, origin.y, ptA.x, ptA.y);
  line(ptA.x, ptA.y, ptB.x, ptB.y);
  line(ptB.x, ptB.y, ptC.x, ptC.y);
  line(ptC.x, ptC.y, ptD.x, ptD.y);
  line(origin.x, origin.y, ptE.x, ptE.y);
    strokeWeight(0.5);
  line(ptE.x, ptE.y, ptF.x, ptF.y);
    strokeWeight(1);
  line(ptC.x, ptC.y, ptF.x, ptF.y);
    strokeWeight(0.5);
  line(origin.x, origin.y, ptG.x, ptG.y);
    strokeWeight(1);
  bezier(ptA.x, ptA.y, ptG.x/2, ptA.y, ptG.x, ptA.y/2, ptG.x, ptG.y);
    strokeWeight(0.5);
  line(ptH.x, ptH.y, ptC.x/2, ptH.y);
    strokeWeight(1);
  line(ptG.x, ptG.y, ptI.x, ptI.y);
    strokeWeight(0.5);
  line(ptJ.x, ptJ.y, ptK.x, ptK.y);
    strokeWeight(1);
  line(ptK.x, ptK.y, ptJd1.x, ptJd1.y);
  line(ptK.x, ptK.y, ptJd2.x, ptJd2.y);
    strokeWeight(0.5);
  line(ptL.x, ptL.y, ptM.x, ptM.y);
  line(ptP.x, ptP.y, ptQ.x, ptQ.y);
    strokeWeight(1);
  line(ptD.x, ptD.y, ptR.x, ptR.y);
  bezier(ptR.x, ptR.y, ptR.x, (ptS.y+ptR.y)/2, (ptS.x+ptR.x)/2, ptS.y, ptS.x, ptS.y);
    strokeWeight(0.5);
  line(ptT.x, ptT.y, ptT.x, ptH.y);
  line(ptU.x, ptU.y, ptV.x, ptV.y);
  line(ptR.x, ptR.y, ptW.x, ptW.y);
    strokeWeight(1);
  line(ptBP.x, ptBP.y, ptR.x, ptR.y);
  line(ptBP.x, ptBP.y, ptW.x, ptW.y);
  line(ptW.x, ptW.y, ptX.x, ptX.y);
    strokeWeight(0.5);
  line(ptZ.x, ptZ.y, ptAA.x, ptAA.y);
  line(ptL.x, ptL.y, Ldiag.x, Ldiag.y);
  line(ptT.x, ptT.y, Tdiag.x, Tdiag.y);
    strokeWeight(1);
  beginShape();
  vertex(ptI.x, ptI.y);
  bezierVertex(ptM.x, (ptM.y+ptN.y)/2, ptM.x, (ptM.y+ptN.y)*.75, ptN.x, ptN.y);
  bezierVertex(ptN.x, (ptN.y+Ldiag.y)*.5, Ldiag.x - Ldiaglen/2*cos(PI/4), Ldiag.y - Ldiaglen/2*sin(PI/4), Ldiag.x, Ldiag.y);
  bezierVertex(Ldiag.x + Ldiaglen/2*cos(PI/4), Ldiag.y + Ldiaglen/2*sin(PI/4), (ptZ.x+Ldiag.x)/2, ptZ.y, ptZ.x, ptZ.y);
  bezierVertex((ptZ.x+Tdiag.x)/2, ptZ.y, Tdiag.x - Tdiaglen/2*cos(PI/4), Tdiag.y + Tdiaglen/2*sin(PI/4), Tdiag.x, Tdiag.y);
  bezierVertex(Tdiag.x + Tdiaglen/2*cos(PI/4), Tdiag.y - Tdiaglen/2*sin(PI/4),ptY.x, (ptY.y+Tdiag.y)/2, ptY.x, ptY.y);
  bezierVertex(ptY.x, (ptY.y+ptX.y)*.75, ptY.x, (ptY.y+ptX.y)*.5, ptX.x, ptX.y);
  endShape();
  line(ptF.x, ptF.y, ptAB.x, ptAB.y);
  line(ptE.x, ptE.y, ptAB.x, ptAB.y);
  line(ptP.x, ptP.y, bkDtL.x, bkDtL.y);
  line(ptP.x, ptP.y, bkDtR.x, bkDtR.y);
  line(ptZ.x, ptZ.y, midDtL.x, midDtL.y);
  line(ptZ.x, ptZ.y, midDtR.x, midDtR.y);
  line(ptBP.x, ptBP.y, frtDtL.x, frtDtL.y);
  line(ptBP.x, ptBP.y, frtDtR.x, frtDtR.y);
}

void drawBra(){
  ellipse(0,0,5,5);
  float overBustDiff = n1.value() - n10.value();
  float underBustDiff = n1.value() - n11.value();
  PVector ptBraBP = new PVector(ptBP.x - 5*valScayl, 0); text("BP", ptBraBP.x, ptBraBP.y);
  PVector ptCB = new PVector(0,0); text("CB", ptCB.x, ptCB.y);
  PVector ptCF = new PVector(ptCB.x + n1val/2, ptCB.y); text("CF", ptCF.x, ptCF.y);
  PVector ptA = new PVector(ptCB.x, ptCB.y - 1.5*valScayl); text("A", ptA.x, ptA.y);
  PVector centSeam = new PVector((ptCB.x+ptCF.x)/2, ptCB.y);
  PVector ptB = new PVector(centSeam.x, ptCB.y - 2.5*valScayl); text("B", ptB.x, ptB.y);
  PVector ptWX = new PVector((ptW.x+ptX.x)/2, (ptW.y+ptX.y)/2);
  float bustDartAng = atan((ptWX.y-ptBP.y)/(ptWX.x-ptBP.x));
  float bustDartLen = (8.5+(overBustDiff*0.05))*valScayl;
  float bustDartWidth = (overBustDiff*valScayl)/2;
  float bustDartAngSm = asin((.5*bustDartWidth)/bustDartLen);
  PVector ptC = new PVector(ptBraBP.x - bustDartLen*cos(bustDartAng-bustDartAngSm), ptBraBP.y - bustDartLen*sin(bustDartAng-bustDartAngSm)); text("C", ptC.x, ptC.y);
  PVector ptD = new PVector(ptBraBP.x - bustDartLen*cos(bustDartAng+bustDartAngSm), ptBraBP.y - bustDartLen*sin(bustDartAng+bustDartAngSm)); text("D", ptD.x, ptD.y);
  PVector ptE = new PVector(ptCF.x, ptCF.y - 2.5*valScayl); text("E", ptE.x, ptE.y);
  PVector ptF = new PVector(ptCB.x, ptCB.y + 2*valScayl); text("F", ptF.x, ptF.y);
  PVector ptG = new PVector(centSeam.x, centSeam.y + 4.5*valScayl); text("G", ptG.x, ptG.y);
  float bkDartWidth = (underBustDiff*valScayl)/6;
  float ftDartWidth = 2*(underBustDiff*valScayl)/6;
  PVector bkDartCent = new PVector((ptA.x+centSeam.x)/2, centSeam.y);
  PVector bkDartR = new PVector(bkDartCent.x + bkDartWidth/2, (ptF.y+ptG.y)/2);
  PVector bkDartL = new PVector(bkDartCent.x - bkDartWidth/2, (ptF.y+ptG.y)/2);
  PVector ptH = new PVector(ptBraBP.x - ftDartWidth/2, ptBraBP.y + 7.5*valScayl); text("H", ptH.x, ptH.y);
  PVector ptI = new PVector(ptBraBP.x + ftDartWidth/2, ptBraBP.y + 7.5*valScayl); text("I", ptI.x, ptI.y);
  PVector ptJ = new PVector(ptCF.x, ptCF.y + 2.5*valScayl);
  PVector ptJneg = new PVector(ptBraBP.x - (ptJ.x - ptBraBP.x), ptBraBP.y);
  
  line(ptCB.x, ptCB.y, ptCF.x, ptCF.y);
  line(ptA.x, ptA.y, ptB.x, ptB.y);
  line(ptB.x, ptB.y, ptC.x, ptC.y);
  line(ptBraBP.x, ptBraBP.y, ptBraBP.x, -200);
  line(ptBraBP.x, ptBraBP.y, ptC.x, ptC.y);
  line(ptBraBP.x, ptBraBP.y, ptD.x, ptD.y);
  line(ptD.x, ptD.y, ptE.x, ptE.y);
  line(ptCF.x, ptCF.y, ptE.x, ptE.y);
  line(ptF.x, ptF.y, ptG.x, ptG.y);
  //ellipse(bkDartCent.x, bkDartCent.y, 5, 5);
  line(bkDartCent.x, bkDartCent.y, bkDartR.x, bkDartR.y);
  line(bkDartCent.x, bkDartCent.y, bkDartL.x, bkDartL.y);
  line(ptBraBP.x, ptBraBP.y, ptH.x, ptH.y);
  line(ptBraBP.x, ptBraBP.y, ptI.x, ptI.y);
  line(ptG.x, ptG.y, ptH.x, ptH.y);
  line(ptI.x, ptI.y, ptJ.x, ptJ.y);
  line(ptJ.x, ptJ.y, ptCF.x, ptCF.y);
  bezier(ptJneg.x, ptJneg.y, ptJneg.x, ptH.y+2.5*valScayl, ptCF.x-1*valScayl, ptI.y - 2*valScayl, ptCF.x - 1*valScayl, ptCF.y);
  
}


