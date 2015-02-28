
float x_aleatorio;
float y_aleatorio;
    void setup(){
    size(400,400);
    background(255);
    rectangulo();
    puntos_aletorios();
    draw();
    }
    
    void  puntos_aletorios(){
    for(int i=1;i<=300;i++){
    x_aleatorio= 20+random(360);
    y_aleatorio= 20+random(360);
    
    rect(x_aleatorio,y_aleatorio,2,2);
    }
    println(x_aleatorio);
    }
    void rectangulo(
    ){
    
    rect(15,15,365,365);  
       
      
    }
