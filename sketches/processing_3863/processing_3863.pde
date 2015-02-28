
int i,j;void draw(){filter(11);smooth();for(j=0;j<200;j++){float r=noise(j*0.02+mouseX,i*0.03+mouseY)*145*(j*0.007),a=(j+i)*0.1,d=3+j*0.05;ellipse(150+r*sin(a),150+r*cos(a),d,d);}i++;}

