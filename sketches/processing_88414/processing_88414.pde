

public void incializaControladores() {  
  controlP5.setColorLabel(color(255, 128));
  Textlabel titulo = controlP5.addTextlabel("titulo_vizualizaciones", "Visualizaciones:", width-150, 30); 

  //------------------------------------
  //checkBoxes
  checkbox_visualizaciones = controlP5.addCheckBox("Visualizaciones", width-200, 40);  
  checkbox_visualizaciones.setColorForeground(color(120));
  checkbox_visualizaciones.setColorActive(color(255));
  checkbox_visualizaciones.setColorLabel(color(128));
  checkbox_visualizaciones.setItemsPerRow(1);
  checkbox_visualizaciones.setSpacingColumn(30);
  checkbox_visualizaciones.addItem("Nodos - Centroides (Z)", 1);
  checkbox_visualizaciones.addItem("Conexiones Totales (X)", 1);
  checkbox_visualizaciones.addItem("Grafo de Vecindad (C)", 1);
  checkbox_visualizaciones.addItem("Nodos de Cluster [Esferas] (B)", 1);
  checkbox_visualizaciones.addItem("Aristas de Cluster (V)", 1);
  checkbox_visualizaciones.addItem("Mostrar conexiones por Cluster (N)", 1);
  checkbox_visualizaciones.addItem("Mostrar solo cluster seleccionado (M)", 1);
  checkbox_visualizaciones.getItem(2).toggle();
  checkbox_visualizaciones.getItem(6).toggle();

  //------------------------------------
  //Controladores del alpha
  Textlabel titulo_alpha = controlP5.addTextlabel("titulo-alpha", "Control del Alpha ", width-150, 150); 
  controlP5.addSlider("Nodos_Centroides", 0, 255, 100, width-200, 170, 100, 10).setId(1);
  controlP5.addSlider("Conexiones_todas", 0, 255, 25, width-200, 183, 100, 10).setId(2);
  controlP5.addSlider("Grafo_Vecindad", 0, 255, 80, width-200, 196, 100, 10).setId(3);
  controlP5.addSlider("Nodos_Cluster", 0, 255, 200, width-200, 209, 100, 10).setId(4);
  controlP5.addSlider("Aristas_Cluster", 0, 255, 150, width-200, 222, 100, 10).setId(5);

  //------------------------------------
  //Controladores del tamano
  Textlabel titulo_tamano = controlP5.addTextlabel("titulo-tamano", "Control del tamano ", width-150, 250); 
  controlP5.addSlider("Nodos", .25, 10, 5, width-200, 265, 100, 10).setId(6);
  controlP5.addSlider("NodosdeCluster", .25, 10, 1, width-200, 278, 100, 10).setId(7);
  controlP5.addSlider("AristasdeCluster", 1, 10, 2, width-200, 291, 100, 10).setId(8);
  controlP5.addSlider("ConexionesdeCluster", 1, 15, 1, width-200, 304, 100, 10).setId(9);

  //------------------------------------
  //Controladores del tamano total
  Textlabel titulo_tamano_total = controlP5.addTextlabel("titulo-tamano-total", "Control del tamano del modelo ", 5, 40); 
  controlP5.addSlider("T1", 1, 15, 3, 10, 55, 130, 10).setId(9);
  slider_ = (Slider)controlP5.controller("T1");

  //------------------------------------
  //Controladores para cortar el arbol

  //Corte por valor 
  Textlabel titulo_clust = controlP5.addTextlabel("titulo-valor-clust", "Valor de corte para clusterizacion", 2, 90); 
  controlP5.addSlider("c_val", 0, 1.15, clust_value, 8, 105, 120, 10).setId(10);
  slider_clust = (Slider)controlP5.controller("c_val");
  controlP5.addButton("Corte_Dendograma", 1, 30, 123, 100, 20);

  //Corte por numero de clusters
  Textlabel titulo_clust_byNum = controlP5.addTextlabel("titulo-numero-clust", "Numero de clusters deseados", 2, 155); 
  num_cluster_textF = controlP5.addTextfield("n_val", 60, 175, 30, 20);
  //num_cluster_textF.setFocus(true);
  controlP5.addButton("Extrae_Clusters", 1, 30, 210, 100, 20);

  //-----------------------------------
  //Tablero de informacion
  tablero = controlP5.addTextarea(
  "tablero", 
  debugM, 
  5, 500, 220, 60);

  //-----------------------------------
  // hack para que se vea todo bien con P3D
  cp5 = createGraphics(width*6, height*6, JAVA2D);

}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    mostrar_all_nodos =          (boolean)((RadioButton)theEvent.group()).getItem(0).getState();
    mostrar_all_conexiones  =    (boolean)((RadioButton)theEvent.group()).getItem(1).getState();
    mostrar_grafo_vecindad =     (boolean)((RadioButton)theEvent.group()).getItem(2).getState();
    mostrar_cluster_nodos =      (boolean)((RadioButton)theEvent.group()).getItem(3).getState();
    mostrar_cluster_aristas =    (boolean)((RadioButton)theEvent.group()).getItem(4).getState();
    mostrar_cluster_conexiones = (boolean)((RadioButton)theEvent.group()).getItem(5).getState();
    mostrar_solo_cluster =       (boolean)((RadioButton)theEvent.group()).getItem(6).getState();
    println();
  }

//  String name_ = theEvent.controller().name();  
//  if (name_.equals("n_val")) {
//    n_val_func((String)theEvent.controller().stringValue());
//  }
}

public void Nodos_Centroides(int valor) {
  alfa_nodos_all = valor;
}

public void Conexiones_todas(int valor) {
  alfa_conexiones_all= valor;
}

public void Grafo_Vecindad(int valor) {
  alfa_grafo_vecindad = valor;
}

public void Nodos_Cluster(int valor) {
  alfa_cluster_nodos = valor;
}

public void Aristas_Cluster(int valor) {
  alfa_cluster_aristas = valor;
}

//---tamanos--------------------
public void Nodos(float valor) {
  size_nodos_all = valor;
}
public void NodosdeCluster(float valor) {
  size_cluster_nodos = valor;
}
public void AristasdeCluster(int valor) {
  size_cluster_aristas = valor;
}
public void ConexionesdeCluster(int valor) {
  size_cluster_conexiones = valor;
}

public void T1(float valor) {
  escala = valor;
}

public void c_val(float valor) {
  clust_value = valor;
}

public void n_val(int valor) {
  clust_num = valor;
}

public void Corte_Dendograma(int theValue) {
  clusters_seleccionados.clear();
  ultimo_cluster_seleccionado = 1;
  clusters = arbol_clusters.clusterizabyValue(clust_value);   
  mensaje = "Generando nuevo cluster para valor de corte: " + clust_value ;
  max_ = max(clusters);

  // tablero.setText(  "        Informacion \n" + "\nNumero de nodos: " + matrix.length +  "\n"
  //  + "Numero de Clusters: " + max_ +  "\n");
  colores = creaColores(clusters, max_);
  updateConexidad();
  time_mensaje = millis()+3000;
}

public void Extrae_Clusters(int theValue) {
  
  clust_num = parseWithDefault(num_cluster_textF.getText(), 1 );
  clust_num = (clust_num<=0)?1:clust_num;
  ultimo_cluster_seleccionado = 1;
  clusters_seleccionados.clear();
  clusters = arbol_clusters.clusterizabyNumber(clust_num);   
  mensaje = "Generando nuevos clusters al numero aproximado: " + clust_num ;
  max_ = max(clusters);
  colores = creaColores(clusters, max_);
  updateConexidad();
  updateClusterSeleccionadosFlags();
  time_mensaje = millis()+3000;
}

public void n_val_func(String theText) {
  clust_num = parseWithDefault(theText, 1 );
  clusters = arbol_clusters.clusterizabyNumber(clust_num);   
  mensaje = "Generando nuevos clusters al numero aproximado: " + clust_num ;
  max_ = max(clusters);
  updateConexidad();
  updateClusterSeleccionadosFlags();
  colores = creaColores(clusters, max_);
  time_mensaje = millis()+3000;
}


