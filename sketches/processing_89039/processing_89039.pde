
/*
* 
*
* @author: Toni Cogolludo Abia kryuak@gmail.com
* Este sketch sigue los movimientos de los visitantes y los conviertes en bolas
* que crecen y decrecen.
* 
*/ 

x=[30,30];
y=[30,30];
float r1 = 0.0; 
float r2 = 0.0; 
float incr = 0.0;

void setup() {
    //this is the size of the mediafacade, leave it unchanged
    size(192, 157); 
    noStroke();
    frameRate(25);
    background(0);
    tracking.connect(); //start tracking

}

void draw () {
    background(0);
    /*
    here is were you can get the tracked blobs
    we recommend you to open de console of your 
    web browser so you can see more details
    */
    tracking.getBlobs(function(blobs) {
        //  console.log(blobs);   
        for(int i = 0; i < blobs.length; i++ ){
            x[i] = blobs[i].x;
            y[i] = blobs[i].y;
         
            fill(255);
            r1 = 125 * sin(incr)/4; 
            r2 = 125 * cos(incr)/4;
            ellipse(x[i], y[i], r1, r1);
            incr = incr + 0.01;
        }
    }); //end tracking  
}
