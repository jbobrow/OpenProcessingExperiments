
void setup(){
size(600,600);
background(255);
smooth();
}
void draw(){


  //cheese cake case
  

  stroke(#98D1FF);
  fill(#D6FFF8);
  
triangle(370,250,550,380,100,450);
  
triangle(370,100,550,230,100,300);

line(370,100,370,250);

quad(100,300,550,230,550,380,100,450);


    //inside : cake
  
  fill(#FFC74D);
  noStroke();
triangle(370,150,530,260,120,330);
triangle(370,250,530,360,120,430);
fill(#F5B73B);
quad(120,330,530,260,530,360,120,430);


//cheese circle

fill(#C17802);
ellipse(390,320,30,30);
ellipse(280,350,60,60);
ellipse(230,340,30,30);
ellipse(490,340,40,40);
ellipse(475,290,30,30);
ellipse(160,380,40,40);
ellipse(350,290,40,40);
arc(190,418,30,30,radians(170),radians(350));
ellipse(230,280,30,30);
ellipse(390,260,30,30);
ellipse(380,200,40,40);
ellipse(470,250,20,20);
arc(300,200,40,40,radians(-35),radians(145));
arc(390,384,60,60,radians(170),radians(350));

}


