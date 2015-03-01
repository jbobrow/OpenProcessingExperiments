
//I wanted to make an automatically generated plaid. The alignment didn't come out quite as I would have liked so I have to do more research on plaids.
//For the color palette, I wanted to be able to easily see what the plaid looks like in different color palettes, but also in different arrangements
//of one color palette. What does it look like if blue1 is in the foreground instead of blue2?, is the kind of question I'd find myself asking when
//working on a pattern. The sketch generates a color palette by generating a random base number and transparency number. Then, randomly picks which
//of Red, Green, or Blue in which to base the color palette. If Red is chosen, the base number is used as the values for green and blue in the resulting
//color. 



color[] palette = new color[4];
int zero;
int trans;
int tp;
int tempwidthinc=0, tempheightinc=0, layeronecol=0, layertwocol=0, layerthreecol=0, layerfourcol=0;
int timer=0, switcher=0;
int halfwide=0, halfhi=0;


void setup(){
  
  size(1280,720);
  halfwide=width/100;
  halfhi=height/100;
  background(255,255,255);
  rectMode(CORNER);
  noStroke();
  zero=(int)random(0,127);
  trans=(int)random(127,255);
  tp = (int)random(1,4);
  
      for(int i=0; i<palette.length; i++)
      {
        palette[i]= varcol ((int)random(127,255), tp);
        //println(palette[i]);
      }

tempwidthinc= (int)random(50, 100);
tempheightinc= (int)random(50, 100);
//println("height inc:"+tempheightinc+"  width inc:"+tempwidthinc);
/*layeronecol= (int)random(0,palette.length);
layertwocol= (int)random(0,palette.length);
layerthreecol= (int)random(0,palette.length);
layerfourcol= (int)random(0,palette.length);*/

layeronecol= 0;
layertwocol= 1;
layerthreecol= 2;
layerfourcol= 3;
    //println(layeronecol+" "+layertwocol+" "+layerthreecol+" "+layerfourcol+" ");
}



void draw(){
  
 background(palette[layerfourcol]);//set background to last color in the palette, also erases previous frame

//SQUARES LAYERS draw the under stripe, the squares, and the over stripe


  for(int i=-16-tempwidthinc/2; i<width; i+=tempwidthinc/2)
  {
   
     fill(palette[layertwocol]);
     for(int n=-10; n<height; n+=20)
     {
       rect(i,n,16,20);
     }
    
  }
 /* for(int i=-tempwidthinc/2; i<width; i+=tempwidthinc+25)
  {
   
     fill(palette[layerfourcol]);
     for(int n=-tempheightinc/2; n<height; n+=tempheightinc+25)
     {
       ellipse(i,n,10,10);
       ellipse(i+tempwidthinc,n+tempheightinc,10,10);
       ellipse(i,n+tempheightinc,10,10);
       ellipse(i+tempwidthinc,n,10,10);
       //ellipse(n,i,10,10);
     }
    
  }*/
  for(int i=-tempwidthinc/2; i<width; i+=tempwidthinc+25)
  {
    // println(i);

     fill(palette[layeronecol]);
     for(int n=-tempheightinc/2; n<height; n+=tempheightinc+25)
     {
       rect(i,n,tempwidthinc,tempheightinc);
     }
     
  }
  for(int i=-26; i<width+26; i+=26)
  {
   
     fill(palette[layerthreecol]);
     for(int n=-6-tempheightinc/2; n<height; n+=tempheightinc/2)
     {
   
       rect(i,n,26,6);
       //rect(i,(n+25),25,25);
     }
    
  }
  
  timer++;
  switcher++;
  //TIMER, switch up colors of the color palette after 1 second/48 frames
  if(timer>= (48*1))
  {
    timer=0;
    int temp= layeronecol;
    layeronecol= layertwocol;
    layertwocol= layerthreecol;
    layerthreecol= layerfourcol;
    layerfourcol= temp;
  //  println(layeronecol+" "+layertwocol+" "+layerthreecol+" "+layerfourcol+" ");
  }
  //GET NEW COLORS if switcher has counted 2 cycles of the current palette
  if(switcher>= (48*(palette.length)*2))
  {
     switcher=0;
     tp = (int)random(1,4);
     zero=(int)random(0,255);
     trans=(int)random(127,255);
  
      for(int i=0; i<palette.length; i++)
      {
        palette[i]= varcol ((int)random(0,255), tp);
        //println(palette[i]);
      }
     
    tempwidthinc= (int)random(50, 200);
    tempheightinc= (int)random(50, 150);
  }
  
}

public color varcol(int col, int type)
{
  color c;
  switch(type){
  case 1: return color(col,zero,zero,trans);
  case 2: return color(zero,col,zero,trans);
  case 3: return color(zero,zero,col,trans);
 
  }  
  return color(0,0,0);
  
}


