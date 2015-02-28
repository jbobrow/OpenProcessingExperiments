
int points = 60;
float[] points_valx = new float[points];
float[] points_valy = new float[points];
int leap = 3; //how far the point travels each iteration also controls opacity

void setup(){
    size(600,600);
    background(200);
    stroke(0);
    fill(0);
    for(int i=0; i<points; i++){
        points_valx[i] = width/2;
        points_valy[i] = height/2;
    }
    ellipse(height/2, width/2, 5, 5)
    }
void draw(){
    for(int i=0;i<points;i++){
        points_valx[i] = points_valx[i]+random(-leap,leap);
        points_valy[i] = points_valy[i]+random(-leap,leap);
        stroke(255-i, 0, 0, leap*3);
        strokeWeight(leap);
        point(points_valx[i],points_valy[i]);
    }
}
