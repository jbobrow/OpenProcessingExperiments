
int x1 = 200;
   int speed = 1;
   int x=0;
   int score=0;
   int speed1 = 2;
   int x2 = 300;
   int speed2 = 6;
void setup(){
 
size(1500,800);
background(0,255,0);

}
void draw(){
  
  float r = random(10);
   
  x1=x1+speed;
  if((x1 > 400) || (x1 < 100)){
    speed = speed * -1;
  }
   
    x2=x2+speed2;
  if((x2 > 1200) || (x2 < 300)){
    speed2 = speed2 * -1;
  }
  
  background(0,255,0);
 
  //target//
  
stroke(0,0,0);
fill(63,196,77);
ellipse(x2,x1,350,350);
fill(255,3,3);
ellipse(x2,x1,275,275);
fill(255,247,0);
ellipse(x2,x1,200,200);
fill(0,0,0);
ellipse(x2,x1,150,150);
fill(37,0,255);
ellipse(x2,x1,100,100);
fill(15,108,69);
ellipse(x2,x1,50,50);
println(x2);


if(x2>727&&x2<767&&x>1200&&x<1400){
println("You scored");
score=score+6;

}

if(x2>577&&x2<616&&x>1200&&x<1400){
println("You scored");
score=score+1;

}

if(x1>616&&x1<654&&x>1200&&x<1400){
println("You scored");
score=score+2;

}

if(x2>654&&x2<676&&x>1200&&x<1400){
println("You scored");
score=score+3;

}

if(x2>676&&x2<703&&x>1200&&x<1400){
println("You scored");
score=score+4;

}

if(x2>703&&x2<727&&x>1200&&x<1400){
println("You scored");
score=score+5;

}

if(x2>880&&x2<918&&x>1200&&x<1400){
println("You scored");
score=score+1;

}

if(x2>842&&x2<880&&x>1200&&x<1400){
println("You scored");
score=score+2;

}

if(x2>817&&x2<842&&x>1200&&x<1400){
println("You scored");
score=score+3;

}



if(x2>767&&x2<792&&x>1200&&x<1400){
println("You scored");
score=score+5;

}


if(x2>800&&x2<817&&x>1200&&x<1400){
println("You scored");
score=score+4;

}
fill(0);
strokeWeight(10);
line(700,565,700,625);
line(800,565,800,625);
strokeWeight(1);


if(score >= 75){
  text("You win!",750,400);
}

 fill(0);
 rect(745,565,17,200);

 triangle(754,740,730,770,779,770);

if(mousePressed ){
  x=x+150;
fill(196+x,172,38);
rect(750,540-x,7,200);

fill(255,0,0);
 
triangle(753,535-x,742,547-x,764,547-x);
fill(0);
strokeWeight(3);
line(599,600,745,625);
line(899,600,755,625);

}else{
  x= 0;
 
fill(196,172,38);
rect(750,540,7,200);
fill(255,0,0);
triangle(753,535,742,547,764,547);
strokeWeight(3);
line(599,600,745,765);
line(899,600,755,765);


}

 
 
 
 
noFill();
strokeWeight(15);
bezier(599, 600,  700, 550,  800, 550,  899, 600);
bezier(599,600,589,630,589,630,539,650);
bezier(899,600,909,630,909,630,959,650);
strokeWeight(1);
textSize(25);
fill(0);
text("Try to hit the target (if you can)!", 500,300);
textSize(55);
text(" You Scored: "+score,  50,50);
text(" ___________________________ ",50,65);
 
 
     
 
}

