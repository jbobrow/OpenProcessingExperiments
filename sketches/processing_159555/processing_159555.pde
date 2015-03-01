
//Description
//I wanted a pattern that revealed itself and had a dynamic color without being too jarring.
//Definitely more than 20 shapes involved since the pattern will repeat itself to fill the screen and the foreground white arc will also repeat itself.
//It is the white arc and the white background which allow me to 'reveal' the pattern.
//The shapes in the pattern are differentiated by size and color to get the layered/border effect. In this way, I can make a pattern and see how it will 
//look in different colors without putting in too much effort to manually change the colors. Every reveal uses different colors and transparency for the shapes.



int x=55,i=105;
int m=0;
boolean add;
int onecol=255;
  int one=255,two=255,three=255,four=255,zero=255, chgcol=1, trans=255;

void setup(){
  
  size(480,600);
  background(150,230,200,255);
 
}
  
void draw(){
    //fill(255,0,0);
   // rect(mouseX,mouseY,40,40);
   //println(""+mouseX+","+mouseY);
   //
   background(255,255,255,255);
   stroke(0,0,0,255);
   fill(255,0,0);
   
   //pattern shapes
   /*ellipse(200,200,35,100);
   triangle(165,150,190,150,165,200);
   triangle(165,250,190,250,165,200);
   triangle(210,150,235,150,235,200);
   triangle(210,250,235,250,235,200);
   */
   //shapes used in background
/*   arc(250,250,35,100,0+(m/100),6.28-(m/100));
   arc(150,150,35,100,6.28-(m/100),0+(m/100)); 
  */
    
   fill(255,255,255);
   text("Delete",0,0,50,50);
   cycle();
  
   pattern(130,150, 1);
    arcs(75,105);
   //randomize pattern spacing
  // i = (int)random(0,50);
   //x = (int)random(50,120);
       
  }
  
public void pattern(int widthmove, int heightmove, int tp)
{
  int count=20;

  int k=0;
  pushStyle();
//  fill(255,255,255); 

    if(m%157==0){
      onecol=(int)random(0,255);
      one=(int)random(0,255);
      two=(int)random(one,255);
      three=(int)random(two,255);
      four=(int)random(three,255);
      zero=(int)random(0,255);
      trans=(int)random(127,255);
       chgcol=(int)random(1,4);  
    }
    //   println(chgcol);
    //println("onecol:"+onecol+" one:"+one+" two:"+two+" three:"+three+" four:"+four+" zero:"+zero+" chgcol:"+chgcol);
   
     //fill(50,onecol,125); 
  noStroke();
   for(int b=-60; b<=width+60; b+=widthmove)
   {
     for(int l=0; l<=height; l+=heightmove){
      
         
       //fill(50,zero,onecol);
       varcol(onecol,chgcol);
         ellipse(60+b,75+l,86,150);
         triangle(0+b,0+l,43+b,0+l,0+b,75+l);
         triangle(0+b,150+l,43+b,150+l,0+b,75+l);
         triangle(77+b,0+l,120+b,0+l,120+b,75+l);
         triangle(77+b,150+l,120+b,150+l,120+b,75+l);
         
      // fill(50,zero,one);
      varcol(one,chgcol);
         ellipse(60+b,75+l,140,76);
         triangle(0+b,0+l,33+b,0+l,0+b,65+l);
         triangle(0+b,150+l,33+b,150+l,0+b,85+l);
         triangle(87+b,0+l,120+b,0+l,120+b,65+l);
         triangle(87+b,150+l,120+b,150+l,120+b,85+l);
       //fill(50,zero,two);
       varcol(two,chgcol);
         ellipse(60+b,75+l,66,130);
         triangle(0+b,0+l,23+b,0+l,0+b,55+l);
         triangle(0+b,150+l,23+b,150+l,0+b,95+l);
         triangle(97+b,0+l,120+b,0+l,120+b,55+l);
         triangle(97+b,150+l,120+b,150+l,120+b,95+l);
       //fill(50,zero,three);
       varcol(three,chgcol);
         ellipse(60+b,75+l,120,56);
         triangle(0+b,0+l,13+b,0+l,0+b,45+l);
         triangle(0+b,150+l,13+b,150+l,0+b,105+l);
         triangle(107+b,0+l,120+b,0+l,120+b,45+l);
         triangle(107+b,150+l,120+b,150+l,120+b,105+l);
       //fill(50,zero,four);
       varcol(four,chgcol);
         ellipse(60+b,75+l,46,110);
         triangle(0+b,0+l,5+b,0+l,0+b,35+l);
         triangle(0+b,150+l,5+b,150+l,0+b,115+l);
         triangle(115+b,0+l,120+b,0+l,120+b,35+l);
         triangle(115+b,150+l,120+b,150+l,120+b,115+l);
       
     }
     
     
   }

   popStyle();
}
public void varcol(int col, int type)
{
  switch(type){
  case 1: fill(col,50,zero,trans); break;
  case 2: fill(zero,col,50,trans); break;
  case 3: fill(50,zero,col,trans); break;
  
  }
  
}

public void arcs(int widthmove, int heightmove)
{
  pushStyle();
  fill(255,255,255);
  /*
    if(m==620)
    onecol=(int)random(0,255);
     fill(50,onecol,125); */
  noStroke();
     for(int b=-35; b<=width+35; b+=widthmove)
   {
     for(int l=-50; l<=height+200; l+=heightmove){
       arc(0+b,50+l,100,200,0+(m/100),6.28-(m/100));
       //arc(150,150,35,100,6.28-(m/100),0+(m/100));
     }
   }
   popStyle();
  
}
  
  
public void cycle()
{
  
         
   if(add){
     
     if(m>=628)
     {
       add=false;
     }
   else{ 
       add=true;
       m+=10;
   }
     
   }
   else
     { 
       if(m<=0){
         add=true;
         m+=10;
       }
      else
         m-=10; 
  
     }  
  
}
  
  
  


