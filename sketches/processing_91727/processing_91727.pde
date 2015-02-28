
// curva.txt, Alberto Pacheco alberto@acm.org, 07/09/2012 v4 (funciones)

background(255, 191, 0);    // color fondo

var curva = function(d) {
    for ( var x = 0; x < 198; x+= 0.5 )
    {
        var y = (x * x) / d;    // formula: d=desplazamiento
        stroke( y*0.8, 0, 90);  // variar tonalidad
        strokeWeight(y/7);      // variar grosor
        point( x, y );          // 1er cuadrante    
        point( 400 - x, y );    // 2o  cuadrante
        point( x, 400 - y );    // 3er cuadrante
        point( 400-x, 400-y );  // 4o  cuadrante 
    }    
};

curva(135);
curva(57);
curva(13);
