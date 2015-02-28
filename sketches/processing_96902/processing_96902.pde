
void drawLights() {
  // a little static light - mw
//  directionalLight(100,100,100, 0,0,-0.5);
  
  // make sure lights aren't affected by PeasyCam 
  cam.beginHUD();
  // some random lights - mw
  // light color contributes significantly to surface color
  for(int i=0; i<lv.length; i++) {
  pointLight(
    red(lcol[i])*lMult,green(lcol[i])*lMult,blue(lcol[i])*lMult, 
    lv[i].x, lv[i].y, lv[i].z);
 
// code to draw the light positions as spheres if so desired   
//  pushMatrix();
//  translate(lv[i].x,lv[i].y,lv[i].z);
//  fill(255);
//  sphere(20);
//  popMatrix();
  }
  
  // make sure lights aren't affected by PeasyCam 
  cam.endHUD();
}

// create randomized positions for our point lights
void initLights() {
  float deg=random(TWO_PI);
  
  for(int i=0; i<lv.length; i++) {
    lv[i]=new Vec3D(
      random(0.2, 0.75)*(float)width,       
      random(300,800),random(300,800)
      );
    lv[i]=lv[i].rotateY(deg);
    deg+=radians(random(-5,5)+137.5);
  }
  
  // light colors
  lcol[0]=color(
    random(100)>90 ? random(200,255) : 0,
    random(200,255),
    255);

  lcol[1]=color(
    255,
    random(50,150),
    random(100)>90 ? random(200,255) : 0);

  lcol[2]=color(random(100,150));
  
  // optionally make all lights monochrome
  if(random(100)>80) {   
    for(int i=0; i<lcol.length; i++) lcol[i]=color(brightness(lcol[i]));
  }
  
  lMult=0;
  for(int i=0; i<lcol.length; i++) lMult+=brightness(lcol[i]);
  lMult=random(220,300)/(lMult/3);

}

void drawDebug() {
  cam.beginHUD();

  hint(DISABLE_DEPTH_TEST);

  noStroke();
  noLights();
  textFont(font);

  drawTextBox(
    "FPS="+nf(frameRate,2,2)+
    (doLoPoly ? "   |   LOPOLY PREVIEW":""),width,1,RIGHT);
  
  drawTextBox("Grid size="+uGridSize,
    width,height-18*2,RIGHT);
  drawTextBox(
    "L="+nf(len, 0, 1)+
    "   str="+nf(str, 0, 1)+
    "   colNoise="+nf(colNoise,0,1), 
    width, height-18,RIGHT);

  drawTextBox("SPACE=Reset   A=Colors   Q=Lights"+
    // fancy ternary operator to exclude STL mention if online
    (online ? "" : "   F1=STL"), 
    0, height-18*2,LEFT);
  drawTextBox("H=Toggle lopoly preview   M=Toggle physics   (Then L=Smooth mesh)", 
    0, height-18,LEFT);

  hint(ENABLE_DEPTH_TEST);

  cam.endHUD();
}

void drawTextBox(String s,float x,float y,int align) {
  float w=textWidth(s)+10;
  
  fill(0,100,200, 200);
  if(align==LEFT) rect(x,y,w,17);
  else rect(x-w,y,w,17);

  textAlign(align);
  fill(255);
  if(align==LEFT) text(s,x+5,y+13);
  else text(s,x-5,y+13);
}

