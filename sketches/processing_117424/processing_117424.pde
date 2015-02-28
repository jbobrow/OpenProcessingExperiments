
// EXAMEN II
//Daniel Posada
///// 1 /////
boolean[] tablero={true,false,null,null,true};
int[] vacios={};
 
int ruedas=0, cruces=0, i=0;
 
while ( i<tablero.length ) {
 
    switch( tablero[i] ) {
        case true:
            ++ruedas;
            break;
 
        case false:
            ++cruces;
            break;
 
        default:
            append(vacios,i);
    }
    i++;
}
 
println("ruedas="+ruedas+", cruces="+cruces+",vacios="+vacios);
 
 
 
///// 2 /////
 
int suma = function(t) {
 
    int s = 0;
 
    for ( int i=0; i<t.length; i++ ) {
 
        s += t[i];
 
    }
 
    println(s);
 
};
 
 
 
suma([2,4,6,8]);
 
 
 
int suma2 = function(t) { // RECURSION
 
    int sz = t.length;
 
    if ( sz===0 ) {
 
        return 0;
 
    }
 
    return t[--sz] + suma2(shorten(t));
 
};
 
 
 
println(suma2([2,4,6,8]));
 
 
 
///// 3 /////
 
int reversa = function(t) { // ciclo for
 
    int r = [];
 
    for (var i=t.length-1; i>=0; i--) {
 
        append(r,t[i]);
 
    }
 
    println(r);
 
};
 
 
 
reversa([2,4,6,8]);
 
 
 
///// 3 /////
 
int rev2 = function(t) { // RECURSION
 
    int tam = t.length;
 
    if (tam>0) {
 
        print(t[tam-1]+".");
 
        rev2(shorten(t));
 
    } else {
 
        println("");
 
    }
 
};
 
 
 
rev2([2,4,6,8]);

