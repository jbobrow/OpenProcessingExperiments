
 float start_x1, start_y1;
float end_x1, end_y1;
float start_w1, end_w1;
float start_h1, end_h1;

float start_x2, start_y2;
float end_x2, end_y2;
float start_w2, end_w2;
float start_h2, end_h2;

int animLength = 90;
int animCount = 0;
int animStep = 1;

void setup()
{
noStroke();
size(600,600);
rectMode(CORNER); //x,y,w,h
start_x1 = 300;
start_y1 = 100;
start_w1 = 300;
start_h1 = 100;

start_x2 = 0;
start_y2 = 350;
start_w2 = 300;
start_h2 = 100;

end_x1 = 150;
end_y1 = 100; 
end_w1 = 300;
end_h1 = 150;

end_x2 = 150;
end_y2 = 350; 
end_w2 = 300;
end_h2 = 300; 

}

void draw()
{
 background(97,22,240); 


animCount+=animStep;
if(animCount>=animLength||animCount<=0)
animStep = -animStep;

float current = animCount/(float)animLength;
float cx1 = lerp(start_x1, end_x1, current);
float cy1 = lerp(start_y1, end_y1, current);
float cw1 = lerp(start_w1, end_w1, current);
float ch1 = lerp(start_h1, end_h1, current);

float cx2 = lerp(start_x2, end_x2, current);
float cy2 = lerp(start_y2, end_y2, current);
float cw2 = lerp(start_w2, end_w2, current);
float ch2 = lerp(start_h2, end_h2, current);

fill(255,241,77);
rect(cx1,cy1,cw1,ch1);
fill(255,241,77); 
rect(cx2,cy2,cw2,ch2); 
//saveFrame();
}


