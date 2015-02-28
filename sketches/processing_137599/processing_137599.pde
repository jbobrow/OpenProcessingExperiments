
mugCup m;
void setup(){
  size(300,300);
  stroke(100);
  m = new mugCup();
}
  
void draw(){
  background(255);
  m.val();
  m.theMug1();
  m.decol();
    if (mouseButton == LEFT){
  m.val = 10;
  } else if(mouseButton == RIGHT){
  m.val = 100;
  }else{
    m.val =1000;
  }
}


     
     
   
   
class mugCup{
  int val;
  float x;
  float y;
  int coffee;
  int milk;
  int orangeJuice;
  float s;
  int k;
  int w;
  float o;
  
  
  mugCup(){ // construction
      val = 0;
      x = 100;
      y = x/2;
      coffee = (#6A0926);
      milk = (#F2F0DA);
      orangeJuice = (#EDB345);
      s = width/2;
      k = height/2-50;
      w = width/2+50;
}

  void theMug1(){ // 
  strokeWeight(2.2);
  stroke(0);
  noFill();
  line(x,x+y+11,x,245);
  line(x,x*2.45,x+y+20,x*2.45);
  line(x+y+20,x+y+11,x+y+20,245);
  noFill();
  arc (x,200,40,60,PI/2,3*PI/2);
  arc (x,200,30,50,PI/2,3*PI/2);
  fill(val);
  ellipse(x+y/1.4,x+y+10,70,25);
}

void val(){ // determind the value for each type of drink
  if (val <= 10){
    val = coffee;
  } else if(val <= 100){
    val = milk;
  } else if(val <= 1000){
    val = orangeJuice;
    
  }
}

void decol(){ //creating decolation for each kind of drink
   o = height/3;
  if (m.val == coffee){
   for(float o = 5; o < 120 ;o+= 10){
     k = height/3;
     smooth();
     noStroke();
     fill(random(240,250));
     ellipse(width/2-17,o,50,50);
   }
     }else if(m.val == milk){
     rect(w,k,30,45);
     fill(#FC2626);
     stroke(0);
     text("MILK",w+2,k+25); 
     }else if (m.val == orangeJuice){
     fill(#EDB345-10);
     ellipse(w+1,k+1,38,30);
     fill(#3CAF44);
     rect(w,k-10,5,5);
     translate(w,k-210);
     rotate(PI/3.5);
     noFill();
     fill(#EDB345-10);
     ellipse(w,k,38,30);
     fill(#3CAF44);
     rect(w,k-10,5,5);
   }
  }
}


