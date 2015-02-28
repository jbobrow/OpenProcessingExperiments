
int s=250,i;float[] W=new float[s*s];void draw(){for(i=s;i<s*s-s;i++){set(i%s,i/s,color(W[i]/16f,W[i]/14f,W[i]/12f));W[i]+=(1-((W[i-1]-W[i+1])*(1f*mouseX/s-0.5)-(W[i-s]-W[i+s])*(1f*mouseY/s-0.5)));}}

