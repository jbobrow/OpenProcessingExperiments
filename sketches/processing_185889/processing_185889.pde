
int eye = 35;
int ws = 300;
int hs = 250;
void setup () {
  size(600, 500);
  smooth();
}

void draw () {
  background(80, 10, 50);
  stroke(254);
  fill(254);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
 if(mouseX > width/2) {
   
   if(mouseY < height/2) {//TOP RIGHT BOX
  fill(#52C2F7);
  //DRAW Cyan Mouth-Open Happy Face
  //(2 CIRCLES (eyes), custom shape HALF CIRCLE (mouth))
  noStroke();
  ellipse(width/2 +100, 70, eye, eye);
   ellipse(width/2 +200, 70, eye, eye);
   beginShape();
     curveVertex(ws +50, hs -100);
     curveVertex(ws +50, hs -100);
     curveVertex(ws +65, hs -80);
     curveVertex(ws +80, hs -65);
     curveVertex(ws +100, hs -58);
     curveVertex(ws +120, hs -53);
     curveVertex(ws +150, hs -50);
     curveVertex(ws +180, hs -53);
     curveVertex(ws +200, hs -58);
     curveVertex(ws +220, hs -65);
     curveVertex(ws +235, hs -80);
     curveVertex(ws +250, hs -100);
     curveVertex(ws +250, hs -100);
   endShape();
   }
   
   if(mouseY > height/2) {//BOTTOM RIGHT BOX
     //DRAW White  Sad Face (2 CIRCLES (eyes), 
     //1 CURVE(curve vertices facing down for sad))
     ellipse(width/2 + 100, height/2 + 70, eye, eye);
     ellipse(width/2 + 200, height/2 + 70, eye, eye);
     beginShape();
       curveVertex(ws + 50, height -50);
       curveVertex(ws + 50, height -50);
       curveVertex(ws + 65, height -70);
       curveVertex(ws + 80, height -85);
       curveVertex(ws + 100, height -92);
       curveVertex(ws + 120, height -97);
       curveVertex(ws + 150, height -100);
       curveVertex(ws + 180, height -97);
       curveVertex(ws + 200, height -92);
       curveVertex(ws + 220, height -85);
       curveVertex(ws + 235, height -70);
       curveVertex(ws + 250, height -50);
       curveVertex(ws + 250, height -50);
       curveVertex(ws + 235, height -60);
       curveVertex(ws + 220, height -75);
       curveVertex(ws + 200, height -82);
       curveVertex(ws + 180, height -87);
       curveVertex(ws + 150, height -90);
       curveVertex(ws + 120, height -87);
       curveVertex(ws + 100, height -82);
       curveVertex(ws + 80, height -75);
       curveVertex(ws + 65, height -60);
       curveVertex(ws + 50, height -50);
       curveVertex(ws + 50, height -50);
   endShape();
   }
 }
 
 if(mouseX < width/2) { 
   
   if(mouseY < height/2) {//TOP LEFT BOX
    //DRAW White Surprised Face (2 CIRCLES (eyes), 
    //2 circles for surprised mouth (first bigger and white, 
    //second within and background color)
  ellipse(100, 70, eye, eye);
  ellipse(200, 70, eye, eye);
  ellipse(150, 175, 170, 70);
  fill(80, 10, 50);
  ellipse(150, 175, 155, 55);
   }
   
   if(mouseY > height/2) {//BOTTOM LEFT BOX
     noStroke();
     //DRAW Cyan Winking Happy Face (1 CIRCLE & 1 RECTANGLE (eyes), 
     //1 CURVE (curve vertices facing up for happy))
     fill(#52C2F7);
     ellipse(100, height/2 + 70, eye, eye);
     rect(170, height/2 + 68, eye, eye/3);
     beginShape();
       curveVertex(50, height -100);
       curveVertex(50, height -100);
       curveVertex(65, height -80);
       curveVertex(80, height -65);
       curveVertex(100, height -58);
       curveVertex(120, height -53);
       curveVertex(150, height -50);
       curveVertex(180, height -53);
       curveVertex(200, height -58);
       curveVertex(220, height -65);
       curveVertex(235, height -80);
       curveVertex(250, height -100);
       curveVertex(250, height -100);
       curveVertex(235, height -90);
       curveVertex(220, height -75);
       curveVertex(200, height -68);
       curveVertex(180, height -63);
       curveVertex(150, height -60);
       curveVertex(120, height -63);
       curveVertex(100, height -68);
       curveVertex(80, height -75);
       curveVertex(65, height -90);
       curveVertex(50, height -100);
       curveVertex(50, height -100);
   endShape();
   }
 }
}

