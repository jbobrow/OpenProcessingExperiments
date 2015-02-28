
//Owaun Scantlebury
//April 3rd 2010

//Press '1' for mode 1
//Press '2' for mode 2
//Press and drag along each quadrant to affect bezier or line
//Press 'c' to use algothimic image
//Press 'm' to see mask image
//Press 'p' to show image - WIP!


public int [][] p1,p2,p3,p4,p5,p6,p7,p8;
public int mode =2;
public boolean choosepics= false;
public String file = "5.jpg";
public int [][] _p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8;
public int [] raw;
public int buttonxcount = 5;
public int buttonycount = 4;
public PGraphics button;

public boolean viewlines= true;
public int sectionwidth;
public boolean usecolorpic =false;
public color []A,B;
public PGraphics b,d,tline;
public boolean dobg=true;
public boolean firstrun=true;
public PImage c,v,mask;
public int maxwidth=screen.width;
public int maxheight= screen.height;
public int numberofsections =8; //32-bit
public int  fw= (int)maxwidth/numberofsections/2;
public int  fh= (int)maxheight/numberofsections;
public int W,pmX,pmY;
public int buttonwidth;
public int buttonheight;

void setbuttons(){
   
button.loadPixels();
button.beginDraw();
button.noStroke();
 for (int x=0;x<W;x+=buttonwidth){
   for (int y=0;y<height;y+=buttonwidth){
  color f = color (height-y,y,x);
  button.fill(f);
//     button.rectMode(CORNER);
    button.rect(x,y,buttonwidth,buttonwidth);
   }
 }
 button.endDraw();
 button.updatePixels();
  
}
//MAIN SETUP
void setup(){
  W=(fw*numberofsections)/2;

buttonwidth=W/(buttonxcount );
 // size(W*2,maxheight/2); //uncomment for local use
 size(640,480);
 buttonheight= height/(buttonycount )+4;
button = createGraphics (W,height,P3D);
setbuttons();
  if (!online ){
    
   println(width+ " "+height); 
  }
  v= loadImage(file); //g.png //s.jpg
  v.resize(W,height);
  mask=new PImage(W,height);
  for (int x=0;x<W;x++){
    for (int y=0;y<height;y++){
      color u = color(height-x,y,x-y);
      mask.set(x,y,u); 
    }

  }
  if(usecolorpic) arraycopy(mask.pixels,v.pixels);
  sectionwidth=W/numberofsections;



  p1=new int[sectionwidth][height];
  p2=new int[sectionwidth][height];
  p3=new int[sectionwidth][height];
  p4=new int[sectionwidth][height];
  p5=new int[sectionwidth][height];
  p6=new int[sectionwidth][height];
  p7=new int[sectionwidth][height];
  p8=new int[sectionwidth][height];
  b=createGraphics(W,height,P3D);
  c= new PImage(sectionwidth,height);
  B = new color[sectionwidth];
  p1[0][0]=0;
  p2[0][0]=0; 
  p3[0][0]=0;
  p4[0][0]=0; 
  p5[0][0]=0;
  p6[0][0]=0;  
  p7[0][0]=W;
  p8[0][0]=height;
  noStroke();
  rectMode(CORNER);
  int t=0;
  b.loadPixels();
  b.beginDraw();
  b.noStroke();
  b.rectMode(CORNER);
  for (int x=0;x<W;x+=sectionwidth){


    B[t]=color(random(200),random(200),random(200));    

    b.fill(B[t]);



    b.rect(x,0,sectionwidth,height);
    t++;
  }
  b.endDraw();
  b.updatePixels();
  nowcolor=B[0];
  if(firstrun)background(1);

}
public color nowcolor;
void mousePressed(){
  if (mouseX<W)  nowcolor = b.get(mouseX,mouseY);
  println(checkwhichquad( nowcolor));
  pmX=mouseX;
  pmY=mouseY;
}


void mouseReleased(){
  if (checkwhichquad( nowcolor)==0)p1[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==1)p2[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==2)p3[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==3)p4[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==4)p5[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==5)p6[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==6)p7[0][0]=mouseY;
  if (checkwhichquad( nowcolor)==8)p8[0][0]=mouseY; 


  pmX=mouseX;
  pmY=mouseY;
}

int  checkwhichquad(color nc){
  int y=0;
  int vv=0;
  for (int x=0;x<W;x+=sectionwidth){

    if(B[vv]==nc)y =vv;  
    vv++;

  }

  return y;
}
void mouseDragged(){
  rect((int)sectionwidth*0.5,p1[0][0],10,10);
  line(pmX,pmY,mouseX,mouseY);
}

//////////////////////////////////////////////////////////////
//MAIN DRAW
void draw(){

  if (usecolorpic){
    image(mask,0,0);
  }
  if(!usecolorpic) image(v,0,0);
  fill(nowcolor);
  rectMode(CENTER);
  rect(mouseX,mouseY,10,10);

  rect((int)sectionwidth*0.5,p1[0][0],10,10);
  rect((int)sectionwidth*1.5,p2[0][0],10,10);
  rect((int)sectionwidth*2.5,p3[0][0],10,10);
  rect((int)sectionwidth*3.5,p4[0][0],10,10);
  rect((int)sectionwidth*4.5,p5[0][0],10,10);
  rect((int)sectionwidth*5.5,p6[0][0],10,10);
  rect((int)sectionwidth*6.5,p7[0][0],10,10);
  rect((int)sectionwidth*7.5,p8[0][0],10,10);

  if (mode==3){



  }


  dobg=true;

  makebz();
  gg();
  dobg=false;

  makebz();

  image(d,0,0);
  
  if (keyPressed && key =='m'){

    image(b,0,0);
  }
  
  if (viewlines) showlines();
  if (choosepics){
   image(button,0,0); 
  }
  firstrun=false;
}


void showlines(){
stroke(color(1,124));
for(int x=0;x<W;x+=sectionwidth){
  
 line(x,0,x,height); 
}

}

void gg(){
  if(firstrun)  tline=createGraphics(W,height,P3D);
  tline.loadPixels();
  tline.beginDraw();
  for (int x=0;x<W;x++){
    for (int y=0;y<height;y++){
      float bb = brightness(d.get(x,y));
      if (bb<255/2){

        stroke(v.get(x,y));
        line(W+x,0,W+x,height);
        tline.stroke(v.get(x,y));
        tline.line(x,0,x,height);

        stroke(233,23,23);
        smooth();
        noFill();
        if(x%6==0)ellipse(x,y,6,6);

      }
    } 

  }
  tline.endDraw();
  tline.updatePixels();

}

void makebz(){
  d=createGraphics(W,height,JAVA2D);
  d.loadPixels();
  d.beginDraw();
  if (dobg) d.background(-1);
  if (!dobg){
    d.smooth();
  }
  d.stroke(1);

  d.noFill();

  if (mode==1)d.bezier(p1[0][0],p2[0][0],p3[0][0],p4[0][0],p5[0][0],p6[0][0] ,p7[0][0],p8[0][0]  ); 
  if (mode==2){
    d.line((int)sectionwidth*0.5,p1[0][0],(int)sectionwidth*1.5,p2[0][0]);
    d.line((int)sectionwidth*1.5,p2[0][0],(int)sectionwidth*2.5,p3[0][0]);
    d.line((int)sectionwidth*2.5,p3[0][0],(int)sectionwidth*3.5,p4[0][0]);
    d.line((int)sectionwidth*3.5,p4[0][0],(int)sectionwidth*4.5,p5[0][0]);
    d.line((int)sectionwidth*4.5,p5[0][0],(int)sectionwidth*5.5,p6[0][0]);
    d.line((int)sectionwidth*5.5,p6[0][0],(int)sectionwidth*6.5,p7[0][0]);
    d.line((int)sectionwidth*6.5,p7[0][0],(int)sectionwidth*7.5,p8[0][0]);
    d.line((int)sectionwidth*7.5,p8[0][0],W,p8[0][0]);

  } 
  d.endDraw();
  d.updatePixels();

}

void keyPressed(){
  if (key=='r')setup(); 
  if (key=='p')choosepics = !choosepics;
  if(!online && key=='s'){

    tline.save("line.png");

  }
  if(key=='1')mode=1;
  if(key=='2')mode=2;
if (key=='l')viewlines = !viewlines;
  if (key=='c'){
    usecolorpic=!usecolorpic;

    if (usecolorpic){
      arraycopy(mask.pixels,v.pixels);

    }
    if (!usecolorpic){

      v= loadImage(file); //g.png //s.jpg
      v.resize(W,height);
      arraycopy(v.pixels,d.pixels);
    }
  }
}






