
import processing.opengl.*;
int heightMap[][][]; // water surface (2 pages). 
int turbulenceMap[][]; // turbulence map 
int line[]; // line optimizer; 
int space; 
public boolean water6trail = true;
PGraphics water3;
int radius, heightMax, density; 
public int cm=1;
int page = 0; 
public int  pw=255;
public int mx,my;
public color c1;
public int ph=255;
public int x = 0;
public int xx = 1;
PImage water,water2,water4,water5,water6; 
PImage [] watera;
public color nowcolor;
  public int xb= 0;
  public int tr = 1;
  
  //-------
public   int iK,xK,yK;
   
 public boolean dovid = false;
import processing.video.*;
MovieMaker mm;
   ////
   
  int pNum =6;//1;//11
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 5;//5
float[] cc = new float[3];
  ///---
  public color goldbase ;
  
void setup() { 
  colorMode(RGB,255);

  size(255,255,P2D);
 // lights();
  watera = new PImage[7];
  smooth();
 water3 = createGraphics(width,height,P3D);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  if (dovid){
  mm = new MovieMaker(this, pw, ph, "drawing.mov", 15, 
                      MovieMaker.ANIMATION, MovieMaker.HIGH);
  }
 goldbase =color(212,175,55);
  nowcolor = goldbase;
  frameRate(15);
   for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(pw),random(ph),random(0.1,0.3));
  }
  initWater(); 
  initMap(); 
 
} 

  int t,xA,X,Y,c,q,w=255,m;
 int n(){return int(noise(xA%w/99f,xA/w/99f,t/99f+m++%2)*w-w/2);}
 
 int r(int a){return int(random(a));}

float nK(int k){return noise(x*0.01,yK*0.01,iK*0.05+k)*5;}
 
void draw() {
 if ( (width > pw )&& (height > ph)){
  mx = mouseX/3;
  my = mouseY/3;}
  else
  {
    mx = mouseX;
  my = mouseY; 
  }
  
  x++;
 
 if (x == water.height-1){
  x= 0;
  }
  
  waterFilter(); 
  updateWater(); 
  page ^= 1; // page switching. 
  
  ///////////
 
  int wx=water.width,hx=water.height;
        t++;
        iK++;
  
filter(11);//11
   watera[2]=new PImage(pw,ph);
   for(xA=0;++xA<w*w;){
    // X=xA%w+n();
     X=xA%w+n();
     //Y=xA/w+n();
     
     Y=xA/w+n();
        // c=50+(get(X,Y)>>8&w);
        // c=Y+(get(X,Y)>>8&w);  // nice
        // c=X+(get(X,Y)>>8&w); // dark nice
        // c=Y-(get(X,Y)>>8&w);
         
          if (xA%2==0){
                  //  colorMode(HSB,255);
                  c1=50+(get(X,Y)>>8&w);
                  //c=Y+(get(X,Y)>>8&w);//8
                  c=Y+(get(X,Y)>>8&w);//8
                  //q=X+(get(Y,X)>>8&w);
              
           q=Y-(get(Y,X)>>8&w);
    
            }
        if (xA%2==1){
              c1=50+(get(X,Y)>>8&w);
            // colorMode(RGB,255);
            c=Y+(get(X,Y)>>8&w);//8
            //q=X+(get(Y,X)>>8&w);
            // q=Y-(get(Y,X)>>8&w);
      
        q=Y-(get(Y,X)>>8&w);
      
      }
       
       //colorMode(RGB,255); 
        colorMode(RGB,255); 
        if (xA%2==0 || xA%2 == 1 ){
          //colorMode(RGB,255);
          // colorMode(HSB,255);
          //    water.pixels[xA]=color(c,c/2,c*2); //pink blue
          //    water.pixels[xA]=color(c/4,c/2,c*2); //dark blue
  
          // water.pixels[xA]=color(c/xA,q/xA,c*2^int(v)); //wow NICE!
 
 
       //   water.pixels[xA]=color(c/xA,q/xA,c*2^2); //wow NICE!
 
 
  // water.pixels[xA]=color(c/xA,q/xA,c*2); //wow NICE!
  
  // water.pixels[xA]=color(c,c^q,q*2); //wow dark blue
   
  //   water.pixels[xA]=color(c/xA,c/xA,c*2); //wow dark blue
  
  
if (keyPressed == true && key =='h'){
  colorMode(HSB,255);
  }
  if (keyPressed == true && key =='i'){
  colorMode(RGB,255);
  }
  
//    water.pixels[xA]=color(c,c/xA,c*xA); // nice pink

  //  water.pixels[xA]=color(c,c*xA,c/xA); // ruff gold

  // water.pixels[xA]=color(c,c+xA,c*xA); // more pink
  
     //water.pixels[xA]=color(c,c+mouseX,c*xA); // right stuff
   
// water.pixels[xA]=color(c-my,c-mx,c*xA);  // DEFAULT
 
//if (X > 0 && Y > 0 && X< water.width && Y < water.height){
// water.pixels[X+water.width*Y]=blendColor(color(c-my,c-mx,c*xA), water.pixels[X+water.width*Y],4); 
//}
 // right stuff 
//stroke(color(c-my,c-mx,c*xA));

 //blendColor(color(c-my,c-mx,c*xA),water.pixels[xA],4); // right stuff 
 
 //water6.pixels[xA]=blendColor(water.pixels[xA],color(c-my,c-mx,c*xA),4);
//water4.pixels[xA]=color(q-mouseY,c-mouseX,c*xA); //great
   
 //   water.pixels[xA]=color(c-mouseY,q-mouseX,q*xA); // converge greate
   
 water.pixels[xA]=color(c-mouseY,q-mouseX,q/xA); // HSB 3D
    
     // water.pixels[xA]=color(q-mouseY,q-mouseX,q/xA); // HSB 3D

//      if (q < water.pixels.length && q > 0 ){ //misread
//      water.pixels[(xA/q)*2]=color(c-mouseY,c-mouseX,c*xA); 
//      }
      
   // water.pixels[xA]=blendColor(color(c-mouseY,c-mouseX,c*xA),water.pixels[xA],4);
//          water.pixels[xA]=color(c/4,c/2,c*xA); //pink blue
       
      //    water.pixels[xA]=color(c,c,c*2); // blue
          
      //   water.pixels[xA]=color(c,c,c); 
    //     water.pixels[xA]=color(c,c,c*1.3); //grey sky
           
      //   water.pixels[xA]=color(c,c,c/1.3); //gold sky // NICE!!
     //  water.pixels[xA]=color(c,c/3.2,c); //light purple sky
       }
        
      if (xA%2==1 && keyPressed == true && key =='c'){
//
 //water.pixels[xA]=blendColor(color(c-mouseY,c-mouseX,c*xA),water.pixels[xA],2);


 // water.pixels[xA]=color(c-mouseY,c-mouseX,c*xA);
//       // water.pixels[xA]=color(xA,c,c*2);
//         water.pixels[xA]= color(nK(mouseX)%2,1+nK(10+mouseY)%1,1+nK(20)%1);
      }
//        



      //  water.pixels[c]=color(r(99)*r(99)); // nicer       
    
        //set(xA%wx,i/hx,color(.3+v*.3,v,1,.05));}
        //water.pixels[xA]=color(.3+v*.3,v,1,.05);
       // water.pixels[xA]=color(v,v,1,.05);
         water5.pixels[xA]=color(c-my,c-mx,c*xA);
        watera[0].pixels[xA]=color(c-my,c-mx,c*xA);
        // watera[2].pixels[xA]=color(c1,c1,c1*2);
       watera[3].pixels[xA]=color(c-my,c-mx,c*xA);
        watera[2].set(X,Y,color(c,c,c*2));
       }
  // watera[3].pixels[xA]=color(c-my,c-mx,c*xA);
  
 // watera[3].pixels[xA]=color(c-my,c-mx,c*xA);
  
  ///////////
  if (xx==1){ 
 //lit2();
  }
  if (xx ==2){
   lit();
   } 
   water5.updatePixels();
   image(water2,0,0);
//   image(water4,pw,0);
//   image(water5,0,ph);
//   image(water6,pw,ph);
//   image(watera[0],pw*2,0);
//   image(watera[1],pw*2,ph);
//   image(watera[2],0,ph*2);
//   image(watera[3],pw*2,ph*2);
//   if (keyPressed()  && key = '3'){
//   
//   }
     
   //works fine here
  smooth();
  stroke(x,x,x);
  //stroke(color(pixels[mouseX+width*mouseY]));
  ellipse(water.width/2,x,20,10);
    line(0,my,water.width,my);
    line(mx,0,mx,water.height);
  if (mousePressed ){
    if(mx < water.width-1 && mx > 1 && my > 1 && my < water.height-1){
      
    fill(color(water.pixels[mx+my*water.width] ));
    } 
      noStroke();
      ellipse(mx,my,22,12);  
       
  }
  else
   { 
     noFill();
     noStroke();
      ellipse(mx,my,11,6);  
      if (mx <water.width -1 && mx > 1 && my > 1 && my < water.height-1){
       
        fill (color(water2.pixels[mx+my*water.width]));
         
       ellipse(mx,my,13,8);  
      }
//
   }
if (keyPressed && key == 's'){
          filter(BLUR,1.f);    //  filter(BLUR,0);
}
  if ( (  (my == x )     )&& ( mx == water.width /2  || ( mx < water.width /2 +20 && mx  > water.width /2 -20)  )&& mousePressed == false ){ //  && ( mouseX < width/2 -20 || mouseX > width /2 +20) ){
exit();
  }    
    // println(str(xx)+ " "+str(x)+" "+str(mouseY) + " "+str(width/2) + " "+str(mouseX) );    
  
    if (dovid){
     mm.addFrame(watera[3].pixels,pw,ph); 
    }
        
} 
 
 
void initWater() { 
  float zoff = 0; 
  water = new PImage(pw,ph); 
    water2 = new PImage(pw,ph); 
    water4 = new PImage(pw,ph); 
    water5 = new PImage(pw,ph); 
    water6 = new PImage(pw,ph); 
    for (int wa = 0;wa < watera.length;wa++){
      watera[wa]=new PImage(pw,ph); 
    }
  water.loadPixels(); 
  for (int y = 0; y < water.height; y++) { 
    for (int x = 0; x < water.width; x++) { 
      zoff += 0.0001f; 
      float bright = ((noise(x*0.01f, y*0.01f, zoff)) * 255); 
       tr = int(random(1,6));
       cm = int(random(0,4));
       if (cm > 2)colorMode(RGB,255);
        if (cm < 2)colorMode(RGB,255);
      // tr = tr + 1;
      //water.pixels[x + y * width] = 0xFF000000 | ((int) bright);
         if (x<water.width/4) water.pixels[x + y * water.width]=nowcolor;//212,175,55
         if (x<water.width/2 && x>water.width/3)water.pixels[x + y * water.width]=nowcolor;//212,175,55
        if (x<water.width/3 && x>water.width/4 )water.pixels[x + y * water.width]=nowcolor; //255,215,0
        if (x<water.width/4 && x>water.width/5) water.pixels[x + y * water.width] =nowcolor;//255,204,51
        if (x<water.width/6 && x>water.width/7)water.pixels[x + y * water.width] =nowcolor;//203,161,53,3
        if (x<water.width/7 && x>water.width/8) water.pixels[x + y * water.width] =nowcolor;//255,215,0
        if (x<water.width/9 && x>water.width/9) water.pixels[x + y * water.width] =color(255,215,0);//255,215,0
        if (x<water.width&&x>water.width/2)     water.pixels[x + y * water.width] =nowcolor; //252, 194, 0//gold poppy
         if (x>0&&x<water.width/8)     water.pixels[x + y * water.width] =nowcolor; //gold poppy
        //if (tr == 6){
        // tr = 0; 
      //  }
      watera[1].pixels[x + y * water.width]=-1;
      // |color(203,161,53,3) | color(203,161,53,3)|color(212,175,55)|color(255,215,0)|color(xb,xb*2,3)|((int) bright); 
       //}
     // water.pixels[x + y * width] =color(255,204,51) |color(203,161,53,3) | color(203,161,53,3)|color(212,175,55)|color(255,215,0)|color(xb,xb*2,3)|((int) bright); 
    xb=xb+1; 
      if (xb==221456){
       xb =0; 
      }
  
} 
  } 
  
  water.updatePixels(); 
  water.filter(BLUR, 1.5f); 
} 
 
void initMap() { 
  // the height map is made of two "pages".  
  // one to calculate the current state, and another to keep the previous state. 
  heightMap = new int[2][pw][ph]; 
  line = new int[ph]; 
  for (int l = 0; l < ph; l++) { 
    line[l] = l * pw; 
  } 
  density = 5; 
  radius = 20; 
  space = pw * ph - 1; 
 
  // the turbulence map, is an array to make a smooth turbulence over the height map. 
  turbulenceMap = new int[radius * 2][radius * 2]; // turbulence map. 
  int r = radius * radius; 
  int squarex, squarey; 
  double dist; 
 
  for (int x = -radius; x < radius; x++) { 
    squarex = x * x; 
    for (int y = -radius; y < radius; y++) { 
      squarey = y * y; 
      dist = Math.sqrt(squarex + squarey); 
      if ((squarex) + (squarey) < r) { 
        turbulenceMap[radius + x][radius + y] += (int) (900 * ((float) radius - dist)); 
      } 
    } 
  } 
} 
 
// to make a turbulence, just add the turbulence map, over the height map. 
void makeTurbulence(int cx, int cy) { 
  int r = radius * radius; 
  int left = cx < radius ? -cx + 1 : -radius; 
  int right = cx > (pw - 1) - radius ? (pw - 1) - cx : radius; 
  int top = cy < radius ? -cy + 1 : -radius; 
  int bottom = cy > (ph - 1) - radius ? (ph - 1) - cy : radius; 
 
  for (int x = left; x < right; x++) { 
    int xsqr = x * x; 
    for (int y = top; y < bottom; y++) { 
      if ((xsqr) + (y * y) < r) 
        heightMap[page ^ 1][cx + x][cy + y] += turbulenceMap[radius + x][radius + y]; 
    } 
  } 
} 
 
private void waterFilter() { 
  for (int x = 0; x < water.width; x++) { 
    for (int y = 0; y < water.height; y++) { 
      int n = y - 1 < 0 ? 0 : y - 1; 
      int s = y + 1 > (water.height) - 1 ? (water.height) - 1 : y + 1; 
      int e = x + 1 > (water.width) - 1 ? (water.width) - 1 : x + 1; 
      int w = x - 1 < 0 ? 0 : x - 1; 
 
      // water filter. I used to thought that this effect 
      // had something to do with physics... :) 
 
      // it a kind of image filter, but instead of applying to an image, 
      // we apply it to the height map, that encodes the height of the waves. 
      int value = ((heightMap[page][w][n] + heightMap[page][x][n] 
        + heightMap[page][e][n] + heightMap[page][w][y] 
        + heightMap[page][e][y] + heightMap[page][w][s] 
        + heightMap[page][x][s] + heightMap[page][e][s]) >> 2) 
        - heightMap[page ^ 1][x][y]; 
 
      heightMap[page ^ 1][x][y] = value - (value >> density); 
    } 
  } 
} 
 
private void updateWater() { 
  loadPixels(); 
  watera[1]=new PImage(pw,ph);
 // arraycopy(water.pixels, pixels); // not really needed... 
  for (int y = 0; y < water.height - 1; y++) { 
    for (int x = 0; x < water.width - 1; x++) { 
      // using the heightmap to distort underlying image 
      int deltax = heightMap[page][x][y] - heightMap[page][(x) + 1][y]; 
      int deltay = heightMap[page][x][y] - heightMap[page][x][(y) + 1]; 
 
      int offsetx = (deltax >> 3) + x; 
      int offsety = (deltay >> 3) + y; 
 
      offsetx = offsetx > water.width ? water.width - 1 : offsetx < 0 ? 0 : offsetx; 
      offsety = offsety > water.height ? water.height - 1 : offsety < 0 ? 0 : offsety; 
 
      int offset = (offsety * water.width) + offsetx; 
      offset = offset < 0 ? 0 : offset > space ? space : offset; 
      // Getting the water pixel with distortion and... 
      // apply some fake lightning, in true color. 
      int pixel = water.pixels[offset]; 
      int pixel2 = watera[1].pixels[offset]; 
            
      int red = (pixel >> 16) & 0xff; 
      int green = (pixel >> 8) & 0xff; 
      int blue = (pixel) & 0xff; 
      int light = (deltax + deltay) >> 6; 
      red += light; 
      green += light; 
      blue += light; 
      red = red > 255 ? 255 : red < 0 ? 0 : red; 
      green = green > 255 ? 255 : green < 0 ? 0 : green; 
      blue = blue > 255 ? 255 : blue < 0 ? 0 : blue; 
      // updating our image source. 
      water2.pixels[line[y] + x] = 0xff000000 | (red << 16) | (green << 8) | blue; 
      watera[5].pixels[line[y] + x] = 0xff000000 | (red << 16) | (green << 8) | blue; 
     
      int red2 = (pixel2 >> 16) & 0xff; 
      int green2 = (pixel2 >> 8) & 0xff; 
      int blue2 = (pixel2) & 0xff; 
      int light2 = (deltax + deltay) >> 6; 
      red2 += light2; 
      green2 += light2; 
      blue2 += light2; 
      red2 = red2 > 255 ? 255 : red2 < 0 ? 0 : red2; 
      green2 = green2 > 255 ? 255 : green2 < 0 ? 0 : green2; 
      blue2 = blue2 > 255 ? 255 : blue2 < 0 ? 0 : blue2; 
      
      watera[1].pixels[line[y] + x] = 0xff000000 | (red2 << 16) | (green2 << 8) | blue2; 
      
    } 
  } 
 water2.updatePixels(); 
  water3.beginDraw();
  water3.image(water2,0,0,width,height);
 // water
 //water3.endDraw();
  water3.updatePixels();
  
  water4.pixels = water2.pixels;
//  water5.pixels= water2.pixels;
  //water6.pixels = water2.pixels;
} 
 
void mouseDragged(){ 
 // makeTurbulence(mouseX,mouseY); 
} 
 
void mousePressed() { 
 // makeTurbulence(mouseX,mouseY); 
   Particle[] p = new Particle[pNum];
   xx = xx + 1;
   if (xx ==3)
   {
    xx = 1; 
   }
   
} 

void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
 // background(0);
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
}
//void keyPressed(){
// if (key == 'k'){
//    makeTurbulence(mouseX,mouseY); 
// } 
//}
void lit(){
 water.loadPixels();
 if (!water6trail){
 water6= new PImage (pw,ph);
 }
 
  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  for(int y=0;y<water.height;y++){
    for(int x=0;x<water.width;x++){
        int pos=y*water.width+x;
        color col = water.pixels[pos];
        color col2 = water6.pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        
        float rr2 = col2 >> 16 & 0xff;
        float gg2 = col2 >> 8 & 0xff;
        float bb2 = col2  & 0xff;
        
        for(int i=0;i<pNum;i++){
          dis =dist(p[i].xpos,p[i].ypos,x,y)/2;
          rr += cc[0]/dis-(gain);
          gg += cc[1]/dis-(gain);
          bb += cc[2]/dis-(gain);
          
            rr2 += cc[0]/dis-gain;
          gg2 += cc[1]/dis-gain;
          bb2 += cc[2]/dis-gain;
        }
        
        
        
        
        water.pixels[pos]=color(rr,gg,bb);
        watera[3].pixels[pos]=color(rr,gg,bb);
        water6.pixels[pos]=color(rr2,gg2,bb2);
    }
  }
  water.updatePixels();
}
class Particle{
  float xpos,ypos,del;
  Particle(float x,float y,float d){
    xpos=x;
    ypos=y;
    del = d;
  }
  void update(){
   // xpos += (mouseX-xpos)*del;
    //ypos += (mouseY-ypos)*del;
    
    xpos += (mx-xpos)*del;
    ypos += (my-ypos)*del;
  }
}

void lit2(){
 loadPixels();
 water.loadPixels();
  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  for(int y=0;y<water.height;y++){
    for(int x=0;x<water.width;x++){
        int pos=y*water.width+x;
        color col = water.pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
          dis =dist(p[i].xpos,p[i].ypos,x,y)/2;
          rr += cc[0]/dis-gain;
          gg += cc[1]/dis-gain;
          bb += cc[2]/dis-gain;
        }
        pixels[pos]=color(rr,gg,bb);
    }
  }
  water.updatePixels();
  updatePixels();
}
void keyPressed(){
 if (key == 'k'){
    //makeTurbulence(mouseX,mouseY); 
    makeTurbulence(mx,my); 
       Particle[] p = new Particle[pNum];    
 } 
 
 if (key == '1'){
   nowcolor = goldbase; 
    initWater();
 }
 if (key == '2'){
  // nowcolor = metalpool; 
  //  initWater();
 }
 if (key == '3'){
   if (dovid){
     mm.finish();
   }
  // nowcolor = whitepool; 
  //  initWater();
 }
 
 if (key=='4'){
   //nowcolor = color(pixels[mouseX+mouseY*width]);
   nowcolor = color(pixels[mx+my*water.width]);
   println(nowcolor);
   initWater();
   
 }
  
  if (key == 'r'){
   setup(); 
  }
 
 if (key =='s'){
  save("fishred.png"); 
 }
 if (key =='5'){
   image(water3,0,0);
 }
 
 if (key =='6')
 {
  water6trail = !water6trail; 
 }
 
}

