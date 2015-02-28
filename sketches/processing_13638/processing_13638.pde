
int b=0; 
void setup() { 
size(200,200); 
background(0);
} 
void draw() { 
for( int y=0; y<300; y=y+50 ) { 
for( int x=0; x<300; x=x+50 ) { 
float d=dist(x,y,100,100);
float c=(sin(radians(d*10+b))+1)*100; 
stroke(random(255),random(255),random(255));
strokeWeight(25);
point(x,y); 

} 
} 
b=b+5; 
}

//Too hard............
                
                
