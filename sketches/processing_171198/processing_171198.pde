
void setup()
{
  size(600, 600);
}

void draw() {


  background(255);
fill(10,90,50);
  rect(150, 0, 100, 200);
  fill(90, 20, 30);

  rect(390, 400, 100, 200);
  fill(90, 20, 30);

  rect (380, 0, 100, 200);
  fill(10, 20, 30);

  rect(270, 400, 110, 200);
  rect(260, 0, 110, 200);
  fill(10, 90, 50);
  rect(160, 400, 100, 200);
  {

    int sec= second()*1;
    fill(90, 20, 30);
    noStroke();

    textSize(100);
    text(sec, 370, 340);
   
    {
      fill(10,90,50);
    rect(390, 400, sec*1.7, 200);
   rect (380, 0, sec*1.7, 200);
    }

}
    int min= minute()*1;


    fill(10, 20, 30);

    textSize(100);
    text(min, 250, 340);  
   
  {
  fill(90,20,30);  
 rect(270, 400, min*1.8, 200);
  rect(260, 0, min*1.8, 200);
  }
    
    
    
    
    int h= hour()*1;
    fill(10, 90, 50);
    noStroke();

    textSize(100);
    text(h, 140, 340);
  
 {
   fill(10,20,30);
 rect(150, 0, h*4.2, 200);  

rect(160, 400,h*4.2 ,200);
 }
  
} 
  







