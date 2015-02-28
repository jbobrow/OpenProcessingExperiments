
int points = 60;
float[] points_valx = new float[points];
float[] points_valy = new float[points];
int leap = 1; //how far the point travels each iteration.

void setup(){
    size(600,600);
    background(0);
    for(int i=0; i<points; i++){
        points_valx[i] = width/2;
        points_valy[i] = height/2;
    }
    }
void draw(){
    for(int i=0;i<points;i++){
        points_valx[i] = points_valx[i]+random(-leap,leap);
        points_valy[i] = points_valy[i]+random(-leap,leap);
        stroke(255-i);
        strokeWeight(leap);
        point(points_valx[i],points_valy[i]);
    }
}
