
//Antonio Chavez Chavez//
//Ing. Electronica//


// EXAMEN II

//Ejercicio 1//

boolean[] tablero=[true,false,null,null,true];
int[] vacios=[];

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

 

//Ejercicio 2//

boolean suma = function(t) {

    int s = 0;

    for ( var i=0; i<t.length; i++ ) {

        s += t[i];

    }

    println(s);

};

suma([2,4,6,8]);

boolean suma2 = function(t) { // RECURSION

    int sz = t.length;

    if ( sz===0 ) {

        return 0;

    }

    return t[--sz] + suma2(shorten(t));

};

println(suma2([2,4,6,8]));


//Ejercicio 3a//

boolean reversa = function(t) { // ciclo for

    int r = [];

    for (int i=t.length-1; i>=0; i--) {

        append(r,t[i]);

    }

    println(r);

};

reversa([2,4,6,8]);




//Ejercicio 3b//

boolean rev2 = function(t) { // RECURSION

    int tam = t.length;

    if (tam>0) {

        print(t[tam-1]+".");

        rev2(shorten(t));

    } else {

       println("");

    }

};

rev2([2,4,6,8]);

