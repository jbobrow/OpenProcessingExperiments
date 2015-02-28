
int y1=0;
int y2=0;
int y3=0;
int y4=0;

int z1=0;
int z2=0;
int z3=0;
int z4=0;
int z5=0;

int q1=0;
int q2=0;
int q3=0;
int q4=0;

int d3=125;
int d=100;
int d1=75;

color c1 = color(0, random(255), random(255));
color c2 = color(0, random(255), random(255));
color c3 = color(0, random(255), random(255));
color c4 = color(0, random(255), random(255));

void setup() {
    size(600, 600);
    noStroke();
}

void draw() {
    background(#00ffc3);
    
    fill(c1, 100);
    ellipse(width*1/5, y1, d3, d3);
    y1++;

    fill(c2, 100);
    ellipse(width*2/5, y2, d3, d3);
    y2++;
    
    fill(c3, 100);
    ellipse(width*3/5, y3, d3, d3);
    y3++;
    
    fill(c4, 100);
    ellipse(width*4/5, y4, d3, d3);
    y4++;
    
    


    fill(c2, 150);
    ellipse(width*1/10, z1, d, d);
    z1+=2; 
    
    fill(c4, 150);
    ellipse(width*3/10, z2, d, d);
    z2+=2;
    
    fill(c3, 150);
    ellipse(width*5/10, z3, d, d);
    z3+=2;
    
    fill(c1, 150);
    ellipse(width*7/10, z4, d, d);
    z4+=2;
    
    fill(c2, 150);
    ellipse(width*9/10, z5, d, d);
    z5+=2;
    
    
    //quickest circles
    
    fill(c4, 120);
    ellipse(width*1/5, q1, d1, d1);
    q1+=3;

    fill(c3, 120);
    ellipse(width*2/5, q2, d1, d1);
    q2+=3;
    
    fill(c2, 120);
    ellipse(width*3/5, q3, d1, d1);
    q3+=3;
    
    fill(c1, 120);
    ellipse(width*4/5, q4, d1, d1);
    q4+=3;
     
}


println("a random number between 1 and 6 is " + int(random(11)));


println("a random number between zero and ten is " + int(random(6)+1));
