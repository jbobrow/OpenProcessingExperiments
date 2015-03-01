
//Riley I
//2014, Ale GonzÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡lez

PVector[][][] rays;
float []    circle_offsets;
float[]     circle_radiuses;
PVector[]   circle_centers;

int w = 900;
int h = 900;
int background_color = #eeeedd;
int fill_color = 0xdd002211;
int cx, cy;
int rays_per_circle = 64;
int circles_number  = 16;

PImage bg;

void reset()
{
    background(background_color);
    circle_radiuses = new float[circles_number];
    circle_offsets  = new float[circles_number];
    circle_centers  = new PVector[circles_number];
    rays     = new PVector[rays_per_circle][circles_number][2];      
    float ray_offset = PI / rays_per_circle; 
    PVector prev_center = new PVector(cx, cy);    
    circle_centers[0]  = new PVector(cx + random(-15, 15), cy + random(-15, 15));  
    circle_radiuses[0] = 5;  
    circle_offsets[0]  = 0;
    int last_circle = circles_number-1;    
    for(int i = 1; i < last_circle; i++){
        circle_centers[i]  = new PVector(cx + random(-15, 15), cy);  
        float min_new_r = circle_centers[i].dist(circle_centers[i-1]) + circle_radiuses[i-1];  
        circle_radiuses[i] = random(min_new_r + 5, min_new_r + 20);  
        circle_offsets[i]  = i * PI/180 * (i%2);          
    }
    circle_centers[last_circle]  = new PVector(cx, cy);  
    float min_new_r = circle_centers[last_circle].dist(circle_centers[last_circle-1]) + circle_radiuses[last_circle-1];  
    circle_radiuses[last_circle] = random(min_new_r + 10, min_new_r + 20);   
    circle_offsets[last_circle]  = last_circle * PI/720 * (last_circle%2);       
    float ray_angle; 
    for(int r = 0; r < rays_per_circle; r++) {   
        for(int c = 0; c < circles_number; c++) {
            ray_angle = 2 * ray_offset * r + circle_offsets[c]; 
            rays[r][c][0] = new PVector(circle_centers[c].x + circle_radiuses[c] * cos(ray_angle), circle_centers[c].y + circle_radiuses[c] * sin(ray_angle));
            ray_angle += ray_offset;
            rays[r][c][1] = new PVector(circle_centers[c].x + circle_radiuses[c] * cos(ray_angle), circle_centers[c].y + circle_radiuses[c] * sin(ray_angle));
        }
    }
    display();
}

void setup()
{
    size(w, h); 
    fill(fill_color); 
    noStroke(); 
    cx = width/2;
    cy = height/2;
    reset();
    noLoop();
}

void display()
{
    for(int r = 0; r < rays_per_circle; r++) {  
        beginShape(); 
        for(int c = 0; c < circles_number; c++) {
            vertex(rays[r][c][0].x, rays[r][c][0].y); 
        }
        for(int c = circles_number - 1; c >0; c--) { 
            vertex(rays[r][c][1].x, rays[r][c][1].y);
        }
        endShape(CLOSE);
    }
}
void keyPressed()
{
    if(key=='w') {
        circles_number++;
        reset();
    } else if(key == 'x' && circles_number>0) {
        circles_number--;
        reset();
    } else if(key == 'a' && rays_per_circle>0) {
        rays_per_circle--;
        reset();
    } else if(key == 'd') {
        rays_per_circle++;
        reset();
    }
}

void mouseClicked()
{
    reset();  
    redraw(); 
}

