
class Nodo {
  int num;
  int son_l, son_r;
  float value;

  Nodo(int num_, float value_) {
    num = num_;
    value= value_;
    son_l = -1;
    son_r = -1;
  }
  Nodo(int num_, int son_l_, int son_r_, float value_) {
    num = num_;
    value= value_;
    son_l = son_l_;
    son_r = son_r_;
  }

  int index() { 
    return num;
  }

  float getValue() {
    return value;
  }

  int getLeft_value() { 
    return son_l;
  }
  int getRight_value() { 
    return son_r;
  }

  void display() {
    print("Nodo: " + num + " - " + son_l + " - " + son_r + " " + value + "\n");
  }
}

class Dendograma {
  Nodo[] arbol;
  Nodo raiz;
  String[] dendo_file;
  float[][] dendo;
  int numero_regiones;

  Dendograma(int numero_regiones_) {
    numero_regiones = numero_regiones_;
    dendo = new float[numero_regiones-1][3];
    arbol = new Nodo[2*numero_regiones];
  }

  Dendograma(int numero_regiones_, String ruta) {
    numero_regiones = numero_regiones_;
    dendo = new float[numero_regiones-1][3];
    arbol = new Nodo[2*numero_regiones];

    leeDendograma(ruta);
  }

  void print_() {
    for (int i = 0 ; i < numero_regiones -1;i++) {
      print( dendo[i][0] + " " + dendo[i][1] + " " + dendo[i][2] + "\n");
    }
  }

  void leeDendograma(String ruta) {
    dendo_file = loadStrings(ruta);

    int index = 0;

    while (index < dendo.length) {
      String[] pieces = split(dendo_file[index], ' ');
      dendo[index][0] = Float.parseFloat(pieces[0]);
      dendo[index][1] = Float.parseFloat(pieces[1]);
      dendo[index][2] = Float.parseFloat(pieces[2]);
      index = index+1;
    }

    //LLenamos los primeros n nodos
    for (int i = 0 ; i <= numero_regiones; i++)
      arbol[i] = new Nodo(i, 0);

    for (int i = 0; i < dendo.length ;i++) {
      index = i + numero_regiones + 1;
      arbol[index] = new Nodo(index, (int)dendo[i][0], (int)dendo[i][1], (float)dendo[i][2]);
      raiz = new Nodo(index, (int)dendo[i][0], (int)dendo[i][1], (float)dendo[i][2]);
    }
  }

  LinkedList cortaDendograma(float value) {
    LinkedList saco = new LinkedList();
    LinkedList nodos_corte = new LinkedList();
    saco.addFirst(raiz);
    Nodo jkr;

    while (!saco.isEmpty () ) {
      jkr = (Nodo)saco.getFirst();
      saco.removeFirst();
      //      jkr.display();
      if (jkr.getValue() < value || jkr.getValue() == 0) {
        nodos_corte.addFirst(jkr);
      }
      else {
        saco.addFirst(arbol[jkr.getLeft_value()]);
        saco.addFirst(arbol[jkr.getRight_value()]);
      }
    }      
    return nodos_corte;
  }

  LinkedList getChilds(int i) {
    LinkedList saco = new LinkedList();
    LinkedList childs = new LinkedList();
    saco.addFirst(arbol[i]);
    Nodo jkr;
    
    while (!saco.isEmpty ()) {
      jkr = (Nodo)saco.getFirst();
      saco.removeFirst();
      
      if (jkr.value == 0.0) {
        childs.addFirst(jkr);
      }
      else {
        saco.addFirst(arbol[jkr.getLeft_value()]);
        saco.addFirst(arbol[jkr.getRight_value()]);
      }
    }      
    return childs;
  }

  int[] clusterizabyValue(float value) {
    int[] cluster = new int[numero_regiones];
    Nodo n_tmp;

    //regresa los nodos debajo del corte 
    LinkedList lista_nodos_cluster = cortaDendograma(value);

    for (int i = 0 ; i < lista_nodos_cluster.size(); i++) {
      Nodo jkr = (Nodo)lista_nodos_cluster.get(i);
      //jkr.display();
    }

    for (int i = 0 ; i < lista_nodos_cluster.size(); i++) {
      Nodo jkr = (Nodo)lista_nodos_cluster.get(i);
      LinkedList lista_hojas = getChilds(jkr.index());
      while (!lista_hojas.isEmpty()) {
        n_tmp = (Nodo)lista_hojas.getFirst();
        lista_hojas.removeFirst();
        cluster[n_tmp.index()-1] = i+1;
      }
    }
    return cluster;
  }
}


