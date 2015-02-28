
/**
 *    Live Map Paint by kof 2012
 */


import saito.objloader.*;
OBJModel model, origos;
float rotX;
float rotX2 = HALF_PI;
float rotY;
float al =0;

PGraphics t;
PGraphics a;

PImage original;

PGraphics post;
PFont font;

color c = color(0);

void setup()
{
  size(512, 512, P3D);
  frameRate(25);
  font = loadFont("SempliceRegular-8.vlw");
  textFont(font);
  textMode(SCREEN);

  original = loadImage("texture.jpg");
  a = createGraphics(original.width, original.height, P2D);
  a.beginDraw();
  a.image(original, 0, 0);
  a.textFont(font);
  a.textMode(SCREEN);

  a.background(255);
  a.endDraw();


  model = new OBJModel(this, "weird.obj", OBJModel.RELATIVE, QUADS);
 // origos = new OBJModel(this, "weird.obj", OBJModel.RELATIVE, QUADS);

  // model.enableDebug();
  model.printModelInfo() ;
  //model.disableTexture();

  noStroke();

  background(0);


  noiseSeed(19);
  background(255);
}

/////////////////////////////////////////////////

void draw()
{

  background(original);
  
 // image(original, 0, 0);
  ambientLight(100, 100, 97);

  pointLight(255, 255, 250, 0, -150, 150.);
  pointLight(noise(frameCount/301.0)*70, noise(frameCount/301.1)*70, noise(frameCount/301.2)*75, width, -150, 150.);
  //pointLight(noise(frameCount/300.0)*255, noise(frameCount/300.1)*255, noise(frameCount/300.2)*200, 0, 0, 150.);
  //pointLight(noise(frameCount/301.0)*70, noise(frameCount/301.1)*70, noise(frameCount/301.2)*75, width, 0, 150.);

  original.loadPixels();

  pushMatrix();
  translate(width/2, height/2+450, 0);//(-noise(frameCount/40.0)-0.5)*30.);
  // perspective((noise(frameCount/40.0)-0.5)*1.+45, width/height, 20, 500);
  rotateX(rotY);
  rotateY(rotX+=0.02);


  // PVector stab = model.getVertex(15305).get();
  translate(0, -450, 0);
  scale(25.0);
  //translate(-stab.x,-stab.y-5,-stab.z);

  stroke(255, 20);

  /*
   for (int i =0 ; i < model.getFaceCount();i++) {
   Face f1 = model.getFaceInSegment(0, i);
   Face f2 = origos.getFaceInSegment(0, i);
   
   
   
   
   for(int q =0 ;q< f1.vertices.size();q++){
   
   PVector ref = origos.getVertex(f1.getVertexIndex(q));
   
   PVector orig = origos.getVertex(f1.getVertexIndex(q));
   PVector nor = origos.getNormal(f1.getNormalIndex(q));
   
   PVector uv = origos.getUV(f1.getTextureIndex(q));
   
   
   float ler = (255-brightness(original.pixels[(int)(uv.y*height+width+uv.x*width)]))/255.0;//(-0.2+noise((orig.y+ref.z+orig.z*noise(orig.y+frameCount/12.3)*3.0)/5.0+frameCount/100.0))*1.5;
   
   model.setVertex(f1.getVertexIndex(q),new PVector(
   lerp(orig.x,orig.x+nor.x,ler),//+(noise(orig.y/160.3+frameCount/150.0)-0.5)*15,
   lerp(orig.y,orig.y+nor.y,ler),//+(noise(orig.x/160.2+frameCount/150.0)-0.5)*40,
   lerp(orig.z,orig.z+nor.z,ler)//+(noise((orig.x)/200.1+frameCount/130.0)-0.5)*40
   ));
   }
   }
   */

  noStroke();

  // PVector s = model.getVertex(12000).get();


  pushMatrix();
  // translate(-s.x, -s.y-22, -s.z);

  rotateY(rotX2+=0.02234);
  //lights();
  popMatrix();
  /*

   for(int i = 0; i < model.getVertexCount();i++) {
   PVector orig = origos.getVertex(i).get();
   PVector nor = origos.getUV(i).get();
   
   textureMode(NORMALIZED);
   
   beginShape();
   texture(t);
   endShape();
   }
   */
  //model.draw();




  a.beginDraw();
  //a.image(g,0.4,0.4);
  //fastblur(a, 3);
  //a.blend(g, 0, 0, width, height, 0, 0, width+1, height+1, LIGHTEST);
  //a.filter(GRAY);
  //a.blend(g, 0, 0, width, height, 0, 0, width+1, height+1, OVERLAY);






  for (int i =3 ; i < model.getFaceCount();i++) {
    Face f = model.getFaceInSegment(0, i);
   // Face f2 = origos.getFaceInSegment(0, i);

    float uvd = 0;
    float cx = 0;
    float cy = 0;
    for (int ii = 1;ii<f.vertices.size();ii++) {
      PVector uv1 = f.uvs.get(ii-1);
      PVector uv2 = f.uvs.get(ii);
      cx += (uv1.x+uv2.x)/2.;
      cy += (uv1.y+uv2.y)/2.;

      uvd += dist(uv1.x, uv1.y, uv2.x, uv2.y);
    }

    cx /= 3.;
    cy /= 3.;

    uvd /= 3.;
    uvd *= width;


    //
    float r = 15;
   // if (mousePressed) {





      for (int ii = 0;ii<f.vertices.size();ii++) {

        PVector vert = f.vertices.get(ii);
        PVector uv = f.uvs.get(ii);
        PVector nor = f.uvs.get(ii);

       // PVector orig = f2.vertices.get(ii);





        if (dist(screenX(vert.x, vert.y, vert.z), screenY(vert.x, vert.y, vert.z), 
        mouseX, mouseY)<r) {
          //vertex(vert.x,vert.y,vert.z,uv.x,uv.y);
          a.rectMode(CENTER); 
          a.fill(mouseButton==LEFT?c:255,12);
          a.stroke(0,random(3,50));
          float siz = uvd*2.;//random((uvd*r)/5.);
          a.pushMatrix();
          a.smooth();
          a.translate(cx*a.width, cy*a.height);
          a.rotate(radians(al+=0.01));
          a.rect(0, 0, siz,siz);
          a.popMatrix();
        }
      }
   // }


    //if (100>dist(mouseX, mouseY, screenX(ver.x, ver.y, ver.z), screenY(ver.x, ver.y, ver.z))) {
    // float x1 = uv.x*a.width;//modelX(ver.x,ver.y,0);//+cos(frameCount/30.0)*20.;//map(screenX(vert.x,vert.y,0),0,width,0,uv.x);
    // float y1 = uv.y*a.height;//modelY(ver.x,ver.y,0);//a.height;//+sin(frameCount/30.0)*20.;//map(screenY(vert.y,vert.y,0),0,height,0,uv.y);

    // a.stroke(random(255),10);
    // float y = random(height);
    // a.point(x1, y1);
    //a.text(i,(int)x1,(int)y1);
    /*   
     if(i%1500==0){
     fastblur(g,1);
     blend(g,0,0,width,height,0,0,width,height,ADD);
     }*/


    /////////////////////////////
  }








  noStroke();



  a.endDraw();



  // hacking
  a.loadPixels();
  original.loadPixels();
  for (int q =0 ; q < original.pixels.length;q++)
    original.pixels[q] = a.pixels[q];//color(#ff0000);
  //original.filter(BLUR,0.6);
  original.updatePixels();
  //model.texture(original);
  // model.clampUV();
  //model.mapUVToZeroOne();
  float sc = 25;


  drawModel();  
  //ownDraw();
  popMatrix();
  ///////////////////// postproc

  int randX = 0;//(int)random(-1,2); 
  int randY = 0;//(int)random(-1,2); 


  for (int i =0 ;i<1;i++) {
    //fastblur(g, (int)(noise(i+frameCount/5.0)*2)+1);
    blend(g, 0, 0, width, height, 0+randX, 0+randY, width+randX, height+randY, ADD);

    //fastblur(g,(int)(noise(i+frameCount/6.0)*1+1));
    blend(g, 0, 0, width, height, 0+randX, 0+randY, width+randX, height+randY, SOFT_LIGHT);

    // fastblur(g,(int)(noise(i+frameCount/6.5)*4));
    //blend(g,0,0,width,height,0+randX,0+randY,width+randX,height+randY,LIGHTEST);
  }

  resetMatrix();
  fill(120);
  text("kof 12", width-40, height-10);
}

void mouseReleased() {
  c = color(random(255), random(255), random(255));
}


