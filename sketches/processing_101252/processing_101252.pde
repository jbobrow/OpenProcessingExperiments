
int totalBalls = 16;
Ball[] balls = new Ball[totalBalls];
float targetX, targetY;
int width = 400,height=800;
float pwidth = width*(46.0/(4.0*12.0)),pheight = height*(92.0/(8.0*12.0));
float toffwidth = ((width-pwidth)/2.0),toffheight = ((height-pheight)/2.0);
float triangley=(toffheight)+(pheight*(6.0/8.0)),trianglex =(toffwidth)+(pwidth*(1.0/2.0));
void setup() {
    //pwidth = 400,pheight =600;
    size(400, 800,P3D);
    noStroke();
    smooth();
    background(0);
    targetX = pwidth / 2;
    targetY = pheight / 2;
    fill(color(255, 0, 0));
    rotate(PI/2);
    for (int i = 0; i < totalBalls; i++) {
        Ball ball = new Ball();
        ball.x = random(pwidth);
        ball.y = random(pheight);
        if(i == 0){ball.vx = random(1000) - 500;
        ball.vy = random( 1000) - 500;}
        ball.radius =(2.25/54.0/2.0)*pwidth;
        switch(i)
    {


    


    
    


        
 
  
    case 1: 
      ball.c = #F2F218;     break;
    case 2: 
      ball.c = #141BC9;       break;
    case 3: 
      ball.c = #E52525;  break;
    case 4: 
  ball.c = #A02C85;      break;
    case 5: 
      ball.c = #FFAD08;      break;
    case 6: 
      ball.c = #1BA714;
      break;
    case 7: 
   
      ball.c = #811A1A;
      break;

    case 8: 
    
      ball.c = #000000;
      break;

    case 9: 
      ball.c = #F2F218;
      break;
    case 10: 
      ball.c = #141BC9;
      break;
    case 11: 
      ball.c = #E52525;
      break;
    case 12: 
      ball.c = #A02C85;
      break;
    case 13: 
      ball.c = #FFAD08;
      break;
    case 14: 
      ball.c = #1BA714;
      break;
    case 15: 
      ball.c = #811A1A;
      break;
    }
        balls[i] = ball;
    }
    makeTriangle(trianglex,triangley);
}
  
void draw() {
//        lights();
pushMatrix();
translate(0,0,-50);
perspective();
          pointLight(255, 255, 255, pwidth/4, pheight/2, 400);
  //ambientLight(102, 102, 102);
  lightSpecular(255, 255, 255); 
    background(150);
    layoutTable();
    fill(color(255, 0, 0));
    for (int i = 0; i < totalBalls; i++) {
        balls[i].v.x = balls[i].vx;
        balls[i].v.y = balls[i].vy;
        balls[i].v.normalize();
        
        if(abs(balls[i].v.x) >= abs(balls[i].vx)){
        balls[i].v.x = balls[i].vx;
        balls[i].v.y = balls[i].vy;
        } 
                    balls[i].vx-=balls[i].v.x  ;
        balls[i].vy-=balls[i].v.y ;
        balls[i].x += round(balls[i].vx)/100.0;
        balls[i].y += round(balls[i].vy)/100.0;
        checkWallCollision(balls[i]);
        balls[i].render();
    }
    for (int i = 0; i < totalBalls; i++) {
        for (int j = i + 1; j < totalBalls; j++) {
            float dx = balls[j].x - balls[i].x;
            float dy = balls[j].y - balls[i].y;
            float dist = sqrt(dx * dx + dy * dy);
            if (dist < (balls[j].radius + balls[i].radius)) {
                
                // balls have contact so push back...
                float normalX = dx / dist;
                float normalY = dy / dist;
                float midpointX = (balls[i].x + balls[j].x) / 2;
                float midpointY = (balls[i].y + balls[j].y) / 2;
                balls[i].x = midpointX - normalX * balls[i].radius;
                balls[i].y = midpointY - normalY * balls[i].radius;
                balls[j].x = midpointX + normalX * balls[j].radius;
                balls[j].y = midpointY + normalY * balls[j].radius;
                float dVector = (balls[i].vx - balls[j].vx) * normalX;
                dVector += (balls[i].vy - balls[j].vy) * normalY;
                float dvx = dVector * normalX;
                float dvy = dVector * normalY;
                balls[i].vx -= dvx;
                balls[i].vy -= dvy;
                balls[j].vx += dvx;
                balls[j].vy += dvy;
                balls[j].vx *=0.98;
                balls[j].vy *=0.98;
                
                balls[i].vx *=0.95;
                balls[i].vy *=0.95;
            }
        }
    }
    int moving = 0;
    for( Ball t : balls)
    {
        if (abs(t.vx)<=1 && abs(t.vy)<=1)
        {
            moving = moving +0;
        }
        else
        {
            moving=1;
        }
    }
    if (moving == 0)
    {
        strokeWeight(3);
     stroke(255);
        line(balls[0].x,balls[0].y,mouseX,mouseY);
        noStroke();
        if (mousePressed == true)
        {
            balls[0].vx = (balls[0].x-mouseX)*-5;
            balls[0].vy = (balls[0].y-mouseY)*-5;
        }
    }
    popMatrix();
}
  
void checkWallCollision(Ball ball) {
    if (ball.x < ball.radius+(toffwidth)) {
        ball.x = ball.radius+(toffwidth);
        ball.vx *= -0.85;
    }     if (ball.x > pwidth+(toffwidth) - (ball.radius)) {
        ball.x = pwidth+(toffwidth) - (ball.radius);
        ball.vx *= -0.85;
    }     if (ball.y < ball.radius+(toffheight)) {
        ball.y = ball.radius+(toffheight);
        ball.vy *= -0.85;
    }     if (ball.y > pheight+(toffheight) - (ball.radius)) {
        ball.y = pheight+(toffheight) - (ball.radius);
        ball.vy *= -0.85;
    }
}
  
class Ball {
    PVector v = new PVector(0,0);
  float x = 0;
  float y = 0;
 float vx = 0;
  float vy = 0;
  float gravityX = 0;
  float gravityY = 0;
  float radius = 5.0;
  color c = color(255,255,255);
  
  void render() {     
      pushMatrix();
      translate(this.x,this.y,10);
          fill(this.c);
    shininess(35.0); 
    specular(255, 255, 255);
      sphere(this.radius);
      popMatrix();
 //     ellipse(this.x, this.y, this.radius * 2, this.radius * 2);
  }
}

void stopballs(){
    for(Ball t : balls)
    {
        t.vx =0;
        t.vy=0;
    }
}

void makeTriangle(float x, float y){

    float vert= 2.0*(balls[1].radius)*sin(PI/6.0);
    float horz = 2.0*(balls[1].radius)*cos(PI/6.0);
    balls[1].x = x;    balls[1].y = y;
    
    balls[2].x = x+vert;    balls[2].y = y+horz;
    balls[3].x = x-vert;    balls[3].y = y+horz;
    balls[4].x = x+(2*vert);    balls[4].y = y+(2*horz);
    balls[5].x = x-(2*vert);    balls[5].y = y+(2*horz);
    balls[6].x = x;    balls[6].y = y+(2*horz);
        
    balls[7].x = x+(3*vert);    balls[7].y = y+(3*horz);
    balls[8].x = x-vert;    balls[8].y = y+(3*horz);
    balls[9].x = x+vert;    balls[9].y = y+(3*horz);
    balls[10].x = x-(3*vert);    balls[10].y = y+(3*horz);
    
    balls[11].x = x+(4*vert);    balls[11].y = y+(4*horz);
    balls[12].x = x+(2*vert);    balls[12].y = y+(4*horz);
    balls[13].x = x;    balls[13].y = y+(4*horz);   
    balls[14].x = x-(4*vert);    balls[14].y = y+(4*horz);
    balls[15].x = x-(2*vert);    balls[15].y = y+(4*horz);

}
void layoutTable()
{
   ArrayList<PVector> pockets = new ArrayList<PVector>();
    stroke(0);
    pockets.add(new PVector(0,0));
    pockets.add(new PVector(0,height/2.0));
    pockets.add(new PVector(0,height));
    pockets.add(new PVector(width,0));
    pockets.add(new PVector(width,height/2.0));
    pockets.add(new PVector(width,height));
    for (float i = (toffheight);i<=pheight+ (toffheight)+1;i+=pheight/8.0)
    {
        line((toffwidth),i,pwidth+(toffwidth),i);
    }
    for (float j = (toffwidth);j<=pwidth+(toffwidth)+1;j+=pwidth/4.0)
    {
        line(j,(toffheight),j,pheight+(toffheight));
    }
    noStroke();
    for(PVector p : pockets){
      fill(0);
      ellipse(p.x,p.y,balls[0].radius*2.0*2.25,balls[0].radius*2.0*2.25); 
    }
    noFill();
    
}
