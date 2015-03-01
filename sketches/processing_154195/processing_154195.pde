
int num_stars = 500;
float star_x[] = new float[num_stars];
float star_y[] = new float[num_stars];
float speed[] = new float[num_stars];

void setup() {  //setup function called initially, only once
    size(1280, 720);
    background(0);  //set background white
    
    initialize_stars();
}

void initialize_star(int i){
    star_x[i] = random(width);
    star_y[i] = random(height);
    speed[i] = 1.0 + random(4.0);
}

void initialize_stars(){
    for(int i=0;i<num_stars;i++){
        initialize_star(i);
    }
}

void update_star(int i) {
    star_x[i] = star_x[i] + speed[i];
    if(star_x[i] > width+10){
        initialize_star(i);
        star_x[i] = -10;
    }
}

void update(){
    for(int i=0;i<num_stars;i++){
        update_star(i);
    }
}

void draw() {  //draw function loops 
    update();
    
    background(0);
    fill(255,255,128,220);
    noStroke();
    for(int i=0;i<num_stars;i++){
        ellipse(star_x[i],star_y[i],5,5);
    }
}
