
PFont font; 
PFont font2; 
float leading = 15;
String quote1 = "From body’s self the body cries release; itself to shed in unbodied space:"; 
String quote2 = "but weighed with its blood, dragging a pulse like a chain; breath drawn up and pressed back on itself again;";
String quote3 = "limbs that ebb and flow: in this wilderness, the pulse may run, the blood leap, the body find its egress;";
String quote4 = " swell to its end, flooding sinew and thigh and breast: the body released, to fath, the body released.";
String quote5 = " For body’s freedom its bodied yet: the absolute flesh goes defeat;";
String quote6 = " the crescent flesh weighs like a stone: the body flies within the bone. ";

float x = 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
float x5 = 0;
float x6 = 0;



float xspeed = 1;
float x2speed = 1;
float x3speed = 1;
float x4speed = 1;
float x5speed = 1;
float x6speed = 1;



void setup() 
{  
  size(600, 600);
  background(000); 
 font = loadFont("Didot-HTF-M11-Medium-18.vlw");     
 font2 = loadFont("Didot-HTF-M11-Medium-8.vlw");
 textFont(font); 
 String[] firstquote = split(quote1, " ");
  
  println(firstquote);
  
  
}

void draw () {
  
  textFont(font); 
  background(000);
  //quote 1
   fill(0, 81, 80);
   text(quote1, x, 20, 300, 200);
   
     x = x + xspeed;
    if ((x > 300) || (x < 0)) {
      xspeed = xspeed * -1;
  
 } 
 
  //quote 2
  fill(0, 81, 80);
   text(quote2, x2, 110, 300, 200);
   
     x2 = x2 + x2speed;
    if ((x > 300) || (x < 0)) {
      x2speed = x2speed * -1;
}



  //quote 3
  fill(0, 81, 80);
   text(quote3, x3, 210, 300, 200);
   
     x3 = x3 + x3speed;
    if ((x > 300) || (x < 0)) {
      x3speed = x3speed * -1;
}

  //quote 4
  fill(0, 81, 80);
   text(quote4, x4, 310, 300, 200);
   
     x4 = x4 + x4speed;
    if ((x > 300) || (x < 0)) {
      x4speed = x4speed * -1;
}

  //quote 5
  fill(0, 81, 80);
   text(quote5, x5, 410, 300, 200);
   
     x5 = x5 + xspeed;
    if ((x > 300) || (x < 0)) {
      x5speed = x5speed * -1;
}
  //quote 6
  fill(0, 81, 80);
   text(quote6, x6, 480, 300, 200);
   
     x6 = x6 + x5speed;
    if ((x > 300) || (x < 0)) {
      x6speed = x6speed * -1;
    
      }

square();
front();
}

void square() {
  fill (000);
    rect( 0, 410, 300, 50);
 rect(0,0, 25, 600); 
  rect(50,0, 25, 600);
  rect(100,0, 25, 600); 
  rect(150,0, 25, 600); 
  rect(200,0, 25, 600); 
  rect(250,0, 25, 600);
  rect(300,0, 25, 600); 
  rect(350,0, 25, 600);
   rect(400,0, 25, 600); 
  rect(450,0, 25, 600);
  rect(500,0, 25, 600); 
  rect(550,0, 25, 600);
  
  
    //quote 1
   fill(0, 81, 80);
   text(quote1, x, 20, 300, 200);
   
     x = x + xspeed;
    if ((x > 300) || (x < 0)) {
      xspeed = xspeed * 5;
}

  //quote 3
  fill(0, 81, 80);
   text(quote3, x3, 210, 300, 200);
   
     x3 = x3 + x3speed;
    if ((x > 300) || (x < 0)) {
      x3speed = x3speed * -1;
 
}

   //quote 5
      fill(000);
 text(quote5, x5, 410, 300, 200);
   
     x5 = x5 + xspeed;
    if ((x > 300) || (x < 0)) {
      x5speed = x5speed * -1;
}


}


void front() {
  
   //quote 2
  fill(0, 81, 80);
   text(quote2, x2, 110, 300, 200);
   
   //quote 3
  fill(0, 81, 80);
   text(quote3, 0, 210, 300, 200);
   
      //quote 5
      fill(0, 81, 80);
 text(quote5, 0, 410, 300, 200);
   
   //quote 6
  fill(0, 81, 80);
   text(quote6, 300, 480, 300, 200);
  
} 
  
  


