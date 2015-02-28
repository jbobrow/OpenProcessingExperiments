
int[] tablero=[true,false,null,null,true];

int[] vacios={};

int ruedas=0, cruces=0, i=0;

while ( i<tablero.length ) {

    switch( tablero[i] ) {
    
        case true: ++ruedas; break;
        
        case false: ++cruces; break;
        
        default: append(vacios,i);
    }
    i++;
    }
    println("ruedas="+ruedas+", cruces="+cruces+",vacios="+vacios);
