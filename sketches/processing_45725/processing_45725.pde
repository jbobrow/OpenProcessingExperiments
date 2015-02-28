
int a = 0;
void setup() {
    size(300,300)
    }

void draw () {
    a+=PI/100
    background(140,100,100);
    fill(150,130,60);
    rect(mouseX+50*cos(a), mouseY+50*sin(a), 10, 10)
    }
               
                
