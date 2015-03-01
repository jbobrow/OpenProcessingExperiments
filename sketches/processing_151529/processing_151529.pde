
PImage bubble;
float ball_x;
float ball_y;
float ball_dir = 0;
float ball_size = 30.0;
float pfx = 500.0;float pfy = 400.0;float pfh = random(200);float pfw = random(100);float pfx2 = 430.0;float pfy2 = 400.0; float pfh2 = random(200);float pfw2 = random(100);float pfx3 = 500.0;float pfy3 = 400.0;float pfh3 = random(200);float pfw3 = random(100);
float pfx4 = 510.0;float pfy4 = 425.0;float pfh4 = random(200);float pfw4 = random(100);float pfx5 = 500.0;float pfy5 = 460.0; float pfx6 = 590.0;float pfy6 = 560.0; float pfx11 = -900; float pfy11 = -900;
float pfh5 = random(200);float pfw5 = random(100);float pfh6 = random(200);float pfw6 = random(100);float pfx7 = 490.0;float pfy7 = 175.0;float pfh7 = random(200);float pfw7 = random(100);float pfx8 = 580.0;float pfy8 = 590.0;float pfx9 = 520.0;float pfy9 = 340.0;
float pfh8 = random(200);float pfw8 = random(100);float pfh9 = random(200);float pfw9 = random(100);float pfx10 = 700.0;float pfy10 = 705.0;float pfh10 = random(200);float pfw10 = random(100);
float pfx12 = 400.0;float pfy12 = 345.0;float pfx13 = 621.0;float pfy13 = 243.0;float pfx14 = 900.0;float pfy14 = 780.0;float pfx15 = 800.0;float pfy15 = 10.0;

int hits = 0;
int score = 0;
color ball_color = color (0,0,0);
color a = color (0,255,0);
color b = color (255,0,0);
color c = color (0,0,255);
color d = color (255,255,0);
color e = color (255,0,255);
color f = color (0,255,255);
boolean lvl1 = false;

boolean end = false;
void setup(){

  size(800, 800);
  rectMode(CORNER);
  ellipseMode(CENTER);
  colorMode(HSB, 255, 255, 255);
  noStroke();
  smooth();
  bubble = loadImage("Bubble.jpg");

}

void draw() 

{  
  if (lvl1 == false)
  image(bubble,0,0);
    Level1_1();
    
if (keyPressed)
  {
    if (key == 'p')
    {
      lvl1 = true;
      background(255);
      Level1_2();
    }
  }
    

 if(end == true)
 {textSize(300);
 fill(d);
 text("You WIN!!", 100,400);
 
 }
}

void Level1_1()
{
    

 if (pfy8 <= 800 && pfx8 <= 800)
  {
  pfx++; pfy++; 
  pfx2-=6; pfy2-=2;
  pfx3-=6; pfy3+=4;
  pfx4++; pfy4--;
  pfx5--;pfy6--;
  pfx7++; pfy8++;
  pfy9++; pfx10++;
  pfx12--; pfy13--;
  pfy13+=5; pfx14-=5;
  pfy15+=3; pfy15-=4;
 }
 /*if (pfy8 >= 801 && pfx8 >= 801)
 {
  pfx--; pfy--; 
  pfx2++; pfy2++;
  pfx3++; pfy3--;
  pfx4--; pfy4++;
  pfx5++;pfy6++;
  pfx7--; pfy8--;
  pfy9--; pfx10--;
 
 }*/
 fill(e);
 textSize(80);
 text("Hits:" + hits, 20, 100);
 text("Score:" + score, 500, 100);
  fill(a);
rect(pfx, pfy, pfw, pfh);
  rect(pfx2, pfy2, pfw2, pfh2);
  rect(pfx3, pfy3, pfw3, pfh3);
  rect(pfx4, pfy4, pfw4, pfh4);
  rect(pfx5, pfy5, pfw5, pfh5);
  rect(pfx12, pfy12, pfw10, pfh10);
  rect(pfx14, pfy14, pfw10, pfh10);
  fill(b);
  rect(pfx6, pfy6, pfw6, pfh6);
  rect(pfx7, pfy7, pfw7, pfh7);
  rect(pfx8, pfy8, pfw8, pfh8);
  rect(pfx9, pfy9, pfw9, pfh9);
  rect(pfx10, pfy10, pfw10, pfh10);
  rect(pfx13, pfy13, pfw10, pfh10);
  rect(pfx15, pfy15, pfw10, pfh10);

  ball_x = mouseX;
  ball_y = mouseY;
   
  boolean detected = Collision(ball_x, ball_y,
      ball_size, pfx, pfy, pfw, pfh);       
  boolean detected2 =  Collision(ball_x, ball_y,
      ball_size, pfx2, pfy2, pfw2, pfh2);      
  boolean detected3 =  Collision(ball_x, ball_y,
      ball_size, pfx3, pfy3, pfw3, pfh3);      
  boolean detected4 =  Collision(ball_x, ball_y,
      ball_size, pfx4, pfy4, pfw4, pfh4);        
  boolean detected5 =  Collision(ball_x, ball_y,
      ball_size, pfx5, pfy5, pfw5, pfh5);      
  boolean detected6 =  Collision(ball_x, ball_y,
      ball_size, pfx6, pfy6, pfw6, pfh6);    
  boolean detected7 =  Collision(ball_x, ball_y,
      ball_size, pfx7, pfy7, pfw7, pfh7);     
  boolean detected8 =  Collision(ball_x, ball_y,
      ball_size, pfx8, pfy8, pfw8, pfh8);      
  boolean detected9 =  Collision(ball_x, ball_y,
      ball_size, pfx9, pfy9, pfw9, pfh9);       
  boolean detected10 =  Collision(ball_x, ball_y,
      ball_size, pfx10, pfy10, pfw10, pfh10); 
   boolean detected11 =  Collision(ball_x, ball_y,
      ball_size, pfx12, pfy12, pfw10, pfh10);
   boolean detected12 =  Collision(ball_x, ball_y,
      ball_size, pfx13, pfy13, pfw10, pfh10);
   boolean detected13 =  Collision(ball_x, ball_y,
      ball_size, pfx14, pfy14, pfw10, pfh10);
   boolean detected14 =  Collision(ball_x, ball_y,
      ball_size, pfx15, pfy15, pfw10, pfh10);    
 
 fill(ball_color);     

  if (detected == true){
    ball_color = a;
    pfx = pfx11;  pfy = pfy11;
    hits +=1;
    score += 15;
  }
   else if (detected2 == true) {
    score += 15;
    ball_color = a;
    hits += 1;
    pfx2 = pfx11;  pfy2 = pfy11;
  }
   else if (detected3 == true) {
    score += 15;
    ball_color = a;
    hits += 1;
    pfx3 = pfx11;  pfy3 = pfy11;
  }
   else if (detected4 == true) {
    score += 15;
    ball_color = a;
    hits += 1;
    pfx4 = pfx11;  pfy4 = pfy11;
  }
   else if (detected5 == true ) {
    score += 15;
    ball_color = a;
    hits += 1;
    pfx5 = pfx11;  pfy5 = pfy11;
  }
   else if (detected6 == true && ball_color == a) {
    score -= 15;
    hits += 1;
    pfx6 = pfx11;  pfy6 = pfy11;
  }
   else if (detected7 == true && ball_color == a) {
    score -= 15;
    hits += 1;
    pfx7 = pfx11;  pfy7 = pfy11;
  }
   else if (detected8 == true && ball_color == a) {
    score -= 15;
    hits += 1;
    pfx8 = pfx11;  pfy8 = pfy11;
  }
   else if (detected9 == true && ball_color == a) {
    score -= 15;
    hits += 1;
    pfx9 = pfx11;  pfy9 = pfy11;
  }
   else if (detected10 == true && ball_color == a) {
    score -= 15;
    hits += 1;
   pfx10 = pfx11;  pfy10 = pfy11;
  }
     else if (detected11 == true && ball_color == a) {
    score -= 15;
    hits += 1;
    pfx12 = pfx11;  pfy12 = pfy11;
   
  }
     else if (detected12 == true) {
    score += 15;
    ball_color = a;
    hits += 1;
    pfx13 = pfx11;  pfy13 = pfy11;
  }
     else if (detected13 == true) {
    score += 15;
    ball_color = a;
    hits += 1;
    pfx14 = pfx11;  pfy14 = pfy11;
   
  }
     else if (detected14 == true && ball_color == a) {
    score -= 15;
    hits += 1;
    pfx15 = pfx11;  pfy15 = pfy11;
  }
  
  ellipse(ball_x, ball_y, ball_size*2.0, ball_size*2.0);
  if (hits <=8 && score >= 60)
  {end = true;}
    if (hits > 8)
  {textSize(300);
    fill(e);
  text("YOU LOSE!!!!!!!", 100,400);}

}
void Level1_2()
{

    background(0);
  /*if (pfy8 <= 800 && pfx8 <= 800)
 { 
  pfx++; pfy++; 
  pfx2--; pfy2--;
  pfx3--; pfy3++;
  pfx4++; pfy4--;
  pfx5--;pfy6--;
  pfx7++; pfy8++;
  pfy9++; pfx10++;
 }
 if (pfy8 >= 801 && pfx8 >= 801)
 {
  pfx--; pfy--; 
  pfx2++; pfy2++;
  pfx3++; pfy3--;
  pfx4--; pfy4++;
  pfx5++;pfy6++;
  pfx7--; pfy8--;
  pfy9--; pfx10--;
 
 }*/
 fill(e);
 textSize(80);
 text("Hits:" + hits, 20, 100);
 text("Score:" + score, 700, 100);
  fill(c);
rect(pfx, pfy, pfw, pfh);
  rect(pfx2, pfy2, pfw2, pfh2);
  rect(pfx3, pfy3, pfw3, pfh3);
  rect(pfx4, pfy4, pfw4, pfh4);
  rect(pfx5, pfy5, pfw5, pfh5);
  fill(d);
  rect(pfx6, pfy6, pfw6, pfh6);
  rect(pfx7, pfy7, pfw7, pfh7);
  rect(pfx8, pfy8, pfw8, pfh8);
  rect(pfx9, pfy9, pfw9, pfh9);
  rect(pfx10, pfy10, pfw10, pfh10);

  ball_x = mouseX;
  ball_y = mouseY;
   
  boolean detected = Collision(ball_x, ball_y,
      ball_size, pfx, pfy, pfw, pfh);       
  boolean detected2 =  Collision(ball_x, ball_y,
      ball_size, pfx2, pfy2, pfw2, pfh2);      
  boolean detected3 =  Collision(ball_x, ball_y,
      ball_size, pfx3, pfy3, pfw3, pfh3);      
  boolean detected4 =  Collision(ball_x, ball_y,
      ball_size, pfx4, pfy4, pfw4, pfh4);        
  boolean detected5 =  Collision(ball_x, ball_y,
      ball_size, pfx5, pfy5, pfw5, pfh5);      
  boolean detected6 =  Collision(ball_x, ball_y,
      ball_size, pfx6, pfy6, pfw6, pfh6);    
  boolean detected7 =  Collision(ball_x, ball_y,
      ball_size, pfx7, pfy7, pfw7, pfh7);     
  boolean detected8 =  Collision(ball_x, ball_y,
      ball_size, pfx8, pfy8, pfw8, pfh8);      
  boolean detected9 =  Collision(ball_x, ball_y,
      ball_size, pfx9, pfy9, pfw9, pfh9);       
  boolean detected10 =  Collision(ball_x, ball_y,
      ball_size, pfx10, pfy10, pfw10, pfh10);  
 
 fill(ball_color);     

  if (detected == true){
    ball_color = d;
    pfx = pfx11;  pfy = pfy11;
    hits +=1;
    score -= 15;
  }
   else if (detected2 == true && ball_color == d) {
    score -= 15;
    hits += 1;
    pfx2 = pfx11;  pfy2 = pfy11;
  }
   else if (detected3 == true && ball_color == d) {
    score -= 15;
    hits += 1;
    pfx3 = pfx11;  pfy3 = pfy11;
  }
   else if (detected4 == true && ball_color == d) {
    score -= 15;
    hits += 1;
    pfx4 = pfx11;  pfy4 = pfy11;
  }
   else if (detected5 == true && ball_color == d) {
    score -= 15;
    hits += 1;
    pfx5 = pfx11;  pfy5 = pfy11;
  }
   else if (detected6 == true && ball_color == d) {
    score += 15;
    hits += 1;
    ball_color = b;
    
  }
   else if (detected7 == true && ball_color == d) {
    score += 15;
    hits += 1;
    
  }
   else if (detected8 == true && ball_color == d) {
    score += 15;
    hits += 1;
    
  }
   else if (detected9 == true && ball_color == d) {
    score += 15;
    hits += 1;
    
  }
   else if (detected10 == true && ball_color == d) {
    score += 15;
    hits += 1;
   
  }
  //else {fill(255);}
  
  ellipse(ball_x, ball_y, ball_size*2.0, ball_size*2.0);
  if (hits <= 7 && score == 75)
  {end = true;}
  
  if (hits > 7)
  {textSize(300);
    fill(e);
  text("YOU LOSE!!!!!!!", 400,400);}
}
boolean Collision(
float cirX,
float cirY,
float rad,
float rectX,
float rectY,
float rectW,
float rectH)
{
  float ball_disX = abs(cirX-rectX-rectW/2);
  float ball_disY = abs(cirY-rectY-rectH/2);
  
  if(ball_disX > (rectW/2 + rad)){return false;}
  if(ball_disY > (rectH/2 + rad)){return false;}
  
  if(ball_disX <= (rectW/2)){return true;}
  if(ball_disY <= (rectH/2)){return true;}
  
   float cdist = pow(ball_disX - rectW/2, 2);
  
  return (cdist <= pow(rad,2));

}


