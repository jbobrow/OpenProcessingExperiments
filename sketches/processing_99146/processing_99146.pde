
void setup() {
  size(800, 600);
  background(0); 
}

void draw() { 
  background(0); 
  ellipseMode(CENTER);
  
  float bx = map (mouseX, 0, width, -25, 25);
  float by = map (mouseY, 0, height, -25, 25);
  float cx = map (mouseX, 0, width, 0, 255);
  float cy = map (mouseY, 0, height, 0, 255);
   
   fill(130,30,200);
   ellipse(((width/12)*4)+bx*3,((height/16)*7)+by*3,30,30);
   fill(200,40,130);
   ellipse(((width/12)*5)+bx*2,((height/16)*7)+by*2,30,30);
   fill(30,200,130);
   ellipse(((width/12)*6)+bx,((height/16)*7)+by,30,30);
   fill(200,40,130);
   ellipse(((width/12)*7)+bx*2,((height/16)*7)+by*2,30,30);
   fill(130,30,200);
   ellipse(((width/12)*8)+bx*3,((height/16)*7)+by*3,30,30);
   fill(130,30,200);
   ellipse(((width/12)*4)+bx*3,((height/16)*8)+by*3,30,30);
   fill(200,40,130);
   ellipse(((width/12)*5)+bx*2,((height/16)*8)+by*2,30,30);
    fill(30,200,130);
   ellipse(((width/12)*6)+bx,((height/16)*8)+by,30,30);
   fill(200,40,130);
   ellipse(((width/12)*7)+bx*2,((height/16)*8)+by*2,30,30);
   fill(130,30,200);
   ellipse(((width/12)*8)+bx*3,((height/16)*8)+by*3,30,30);
  
    fill(130,30,200);
    ellipse(((width/12)*4.5)+bx*3,((height/16)*6)+by*3,30,30);
    fill(200,40,130);
    ellipse(((width/12)*5.5)+bx*2,((height/16)*6)+by*2,30,30);
    ellipse(((width/12)*6.5)+bx*2,((height/16)*6)+by*2,30,30);
    fill(130,30,200);
    ellipse(((width/12)*7.5)+bx*3,((height/16)*6)+by*3,30,30);
    
    fill(130,30,200);
    ellipse(((width/12)*4.5)+bx*3,((height/16)*9)+by*3,30,30);
    fill(200,40,130);
    ellipse(((width/12)*5.5)+bx*2,((height/16)*9)+by*2,30,30);
    ellipse(((width/12)*6.5)+bx*2,((height/16)*9)+by*2,30,30);
    fill(130,30,200);
    ellipse(((width/12)*7.5)+bx*3,((height/16)*9)+by*3,30,30);
    fill(130,30,200);
    ellipse(((width/12)*5)+bx*3,((height/16)*10)+by*3,30,30);
    fill(200,40,130);
    ellipse(((width/12)*6)+bx*2,((height/16)*10)+by*2,30,30);
    fill(130,30,200);
    ellipse(((width/12)*7)+bx*3,((height/16)*10)+by*3,30,30);
    fill(130,30,200);
    ellipse(((width/12)*5)+bx*3,((height/16)*5)+by*3,30,30);
    fill(200,40,130);
    ellipse(((width/12)*6)+bx*2,((height/16)*5)+by*2,30,30);
    fill(130,30,200);
    ellipse(((width/12)*7)+bx*3,((height/16)*5)+by*3,30,30);
fill(130,30,200);
    ellipse(((width/12)*5.5)+bx*3,((height/16)*4)+by*3,30,30);
    ellipse(((width/12)*6.5)+bx*3,((height/16)*4)+by*3,30,30);
    fill(130,30,200);
    ellipse(((width/12)*5.5)+bx*3,((height/16)*11)+by*3,30,30);
    ellipse(((width/12)*6.5)+bx*3,((height/16)*11)+by*3,30,30);

}
