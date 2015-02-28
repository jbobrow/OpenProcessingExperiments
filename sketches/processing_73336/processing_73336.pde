
int mil;
int duration = 5;
int sz;
int percent;
 
void setup() 
{
  size(500, 500);
  background(0);
  mil = millis();
}
 
void draw() 
{
  background(0);
  
  noFill();
  smooth();
  percent = round(map(millis()-mil, 0, duration*1000, 0, 100));
   sz = round(map(millis()-mil, 0, duration*1000, 0, 200));
   
  text("LOADING", 100, 230);
  stroke(255);
  rect(100, 240, 200, 20);
 
  
  if (millis()-mil <= duration*1000)
  {
    fill(255); 
    noStroke();
    rect(100, 240, sz, 20);
    text(percent + "%", 165, 230);
  }
  
  else
  {
    fill(255);
    rect(100,240,200,20);
    text("LOADING COMPLETE 100%", 100, 230);
    
  }

}

void mouseClicked()
{
  if (millis()-mil>=duration*1000)
  {
    mil=millis();
  }
}
