
void setup(){

    size(500,500,P3D);
    background(#FFD700);
    fill(#C71585);

}
void draw(){

    
  translate( random(width) , random(height) , 0 );

lights();
noStroke();
    
    
    sphere(30);
    
}
void mousePressed(){

    background(#C71585);
    fill(#FFD700);
    translate( random(width) , random(height) , 0 );

lights();
noStroke();
    
    sphere(30);
    

}

void keyPressed(){

    background(#FFD700);
    fill(#C71585);
    translate( random(width) , random(height) , 0 );

lights();
noStroke();
    
    sphere(30);

}

