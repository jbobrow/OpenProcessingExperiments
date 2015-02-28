
float n;void draw(){noStroke();for(int i=0;i<150;i++)for(int j=0;j<150;j++){fill(lerpColor(#0000FF,#00FF00,.8*noise(i*n,j*n)));rect(i,j,2,2);}n+=.001;}

