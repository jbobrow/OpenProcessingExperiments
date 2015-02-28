
int x1, y1, x2, y2, x3, y3;
int triangleGrow = 10;

void setup() {
    size(500, 500); 
    smooth();
    frameRate(5);
    strokeWeight(3);
    
    noFill();
    background(0);
    stroke(255);
    Center();
} 

int i = 0;
void draw() {
    background(0);
    
    int t = 0;
    while(x2 > 0){
        strokeWeight(3);
        stroke(255);
        
        y1-=triangleGrow;
        x2-=triangleGrow;
        y2+=triangleGrow/2;
        x3+=triangleGrow;
        y3+=triangleGrow/2;
        
        //draw the principal triangle
        triangle(x1, y1, x2, y2, x3, y3);
        
        //draw the inner circle
        stroke(y1, x2, y3);
        strokeWeight(2);
        ellipse(width/2, height/2, x2, x2);
    
        //grow the tiangle
        triangleGrow +=5;
    }

    //draw lines  
    strokeWeight(1);  
    stroke(random(255), random(255), random(255));
    line(0, 0, width, height);
    line(width, 0, 0, height);

    Center();
    
    //moving effect
    i -= 2;
    triangleGrow += (i);
    if(i < -5 ){ i = 0; }    
}

/*custom functions*/
//center de x and y points
void Center(){
    triangleGrow = 10;
    
    x1 = width/2; 
    y1 = height/2;
    x2 = width/2;
    y2 = height/2;
    x3 = width/2;
    y3 = height/2;
}
