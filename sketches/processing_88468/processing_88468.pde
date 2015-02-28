
int counter;
int s;
int cycle;
int downer;
int factor;
int reset;
int bar;

void setup() 

{ 
  size(1300, 1080);
  counter = 1;
  s=10;
  factor=600;
  cycle=360;
  bar=20;
}
 
void draw()

{  
  background(130,196,228);
  noStroke();
  downer++;
  float s;
  s=(counter-(downer)/factor)*.5*height; 
  int rs = s/( height/100);
  int rrs = round(rs) ;   
  fill(255);
  textAlign(LEFT);
  textSize(height/10);
  text("Total Actions",width/10,height/4) ;
  textSize(height/25);
  text("Action Acceleration per a mol of decazeta Plank times (A^2)÷ N x daZt(p)",width*.475,height*.633,width*.413,height*.667);
  fill(160,220,250);
  textAlign(CENTER);
  textSize(height/5);
  text("GO DAY!!",width/2,height/2);
  fill(19,147,206);
  textAlign(CENTER);
  textSize(height/3);
  text(counter,width*3/4,height/3);
  rect(width-bar,height-(counter*(height*.9/140)),bar,counter*(height*.9/140));
  //Actions per decazetamol Plank times --> A/daZNt(p)  
  text(rrs,width/4 ,5 *height/6);
  rect(0,0,bar,s);
  
    if(rrs<=30){
      fill(222,66,66);
      rect(40,s-10,50,10);
      textAlign(LEFT);
      textSize(height/30);
      text("WHOA!",width/10,s-15) ;
    }
   if (rrs<=0){
      fill(222,66,66);
      textAlign(LEFT);
      textSize(height/20);
      text("UH OH . . .",width/10,60) ;
    }
  if (rrs>=70){
      fill(111,222,111);
      rect(40,s-10,50,10);
      textAlign(LEFT);
      textSize(height/30);
      text("AWWYEAAA!",width/10,s+18) ;
    }
  if (rrs>=100){
     textAlign(LEFT);
     textSize(height/20);
     text("IN! TENSE!",width/10, height-60) ;
    }
  
  if (counter>=156){
      background(255);
      fill(19,147,206);
      textAlign(CENTER);
      textSize(height/20);
      text("JK! The counter still works. Let's go for gold!",width/2,height/2);
      textSize(height/5);
      text("IT'S BROKE!",width/2,height/3);
      textSize(height/3);
      text(counter,width/2,height*4/5);
   }

}

void mouseReleased()

{
counter++;
}

