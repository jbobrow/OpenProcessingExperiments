
int w = 50;
int i =0;

color[] purple = {#FF0F00, #FF0F00, #FF3102, #FF6300, #FF9E00, #FFB900, #FFF300, #B0FF03, #00FF82, #00F1FF, #00C3FF, #0077FF, #0200FF, #6A00FF, #B700FF, #FD00FF, #FF006E}; 


    size(800, 50);
    smooth();
    noStroke();


    for(int x = 0; x < width; x +=50){
    i++;
    fill(purple[i]);
        rect(x, 0, w, height);
}
