
size(300,300);
background(0);
fill(255);
for(int i = 0; i<3; i = i+1){
    int inicio = 0;
    if(i == 1){
        inicio = 1;
    }
    
    for(int j = inicio; j<3; j = j+2){
        rect(100*j, i*100, 100, 100);
    }
}
