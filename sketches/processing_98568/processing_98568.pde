
/**
 * IRON MAN HELMET
 * by XDash
 */


void setup(){
  
  size(600,600);
  smooth();
  background(0);
  
}


void draw(){
  
  translate(274,124);
  stroke(255);
  
  drawIronMan();
  
}


void drawIronMan(){
  
  line(0,0,49,0);
  
  line(49,0,35,72);
  line(35,72,0,72);
  
  line(24,157,30,177);
  line(30,177,90,177);
  line(90,177,108,167);
  line(108,167,99,157);
  
  line(120,42,134,211);
  line(124,232,108,362);  
  line(108,362,80,382);

  line(134,211,80,290);
  line(80,290,50,330);
  
  line(49,0,120,42);
  line(120,42,114,137);
  line(114,137,134,211);
  line(134,211,96,299);
  line(96,299,90,337);
  line(90,337,66,357);
  line(66,357,50,330);  
  line(50,330,0,330);    
  
  line(118,157,-118,157);
  line(80,382,-80,382);
  line(56,338,-56,338);     
  
  line(0,0,-49,0);
  
  line(-49,0,-35,72);
  line(-35,72,0,72);
  
  line(-24,157,-30,177);
  line(-30,177,-90,177);
  line(-90,177,-108,167);
  line(-108,167,-99,157);
  
  line(-120,42,-134,211);
  line(-124,232,-108,362);  
  line(-108,362,-80,382);
  
  line(-134,211,-80,290);
  line(-80,290,-50,330);
  
  line(-49,0,-120,42);
  line(-120,42,-114,137);
  line(-114,137,-134,211);
  line(-134,211,-96,299);
  line(-96,299,-90,337);
  line(-90,337,-66,357);
  line(-66,357,-50,330);  
  line(-50,330,0,330);    

}
