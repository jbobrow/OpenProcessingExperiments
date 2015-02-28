
class CLOUD { 
float ypos, speed; 
CLOUD (float y, float s) { 
ypos = y; 
speed = s; 
} 
void update() { 
ypos -= speed; 
if (ypos < width-700) { 
ypos = 500; 
} 
image(c, ypos, 100); 
} 
}

