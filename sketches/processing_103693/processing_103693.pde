
int posX, posY;
Juego juego;
Jugador jugador1, jugador2, jugador3;

void setup(){
  size(600,600);
  
  jugador1 = new Jugador("Blas",0);
  jugador2 = new Jugador("Leo",1);
  //jugador3 = new Jugador("Cari",2);
  
  juego = new Juego();
  
  for(int i = 0; i < 10; i++){
    jugador1.addPersonaje(new Caballero());
  }
  for(int i = 0; i < 10; i++){
    jugador1.addPersonaje(new Arquero());
  }
  
  for(int i = 0; i < 10; i++){
    jugador2.addPersonaje(new Caballero());
  }
  for(int i = 0; i < 10; i++){
    jugador2.addPersonaje(new Arquero());
  }
  /*
  for(int i = 0; i < 10; i++){
    jugador3.addPersonaje(new Caballero());
  }
  for(int i = 0; i < 10; i++){
    jugador3.addPersonaje(new Arquero());
  }
  */
  
  juego.addJugador(jugador1);
  juego.addJugador(jugador2);
  //juego.addJugador(jugador3);
}

void draw(){
  background(200);
  juego.play();
}

class Arquero extends Personaje{
  Arquero(){
    super();
    
    this.ataque = 0.5;
    this.defensa = 1;
    this.distanciaAtaque = 30;
  }
  
  void draw(){
    super.draw();
    
    if(this.isVivo()){
      fill(this.getColor());
    }else{
      noFill();
    }
    triangle(posX,posY,posX+10,posY+10,posX-10,posY+10);
    
    fill(0,255,255);
    rect(posX-10, posY-10, map(this.vida,this.maxVida,0,25,0), 3);
  }
}

class Caballero extends Personaje{
  Caballero(){
    super();
    
    this.ataque = 3;
    this.defensa = 4;
    this.distanciaAtaque = 5;
  }
  
  void draw(){
    super.draw();
    
    if(this.isVivo()){
      fill(this.getColor());
    }else{
      noFill();
    }
    
    ellipse(posX,posY,10,10);
    
    fill(0,255,255);
    rect(posX-10, posY-15, map(this.vida,this.maxVida,0,25,0), 3);
  }

}


class Juego{
  ArrayList jugadores = new ArrayList();
  
  Juego(){
  }
  
  void addJugador(Jugador unJugador){
    unJugador.setJuego(this);
    unJugador.setJuego2Personajes(this);
    jugadores.add(unJugador);
  } 
  
  ArrayList getJugadores(){
    return this.jugadores;
  }
  
  void play(){
    if(!this.quedaSoloUnJugadorVivo()){
      for(int i=0; i < this.getJugadores().size(); i++){
        Jugador jugador = (Jugador) this.getJugadores().get(i);
        jugador.drawPersonajes();
      }
    }
  }
  
  ArrayList getTodosPersonajes(){
    ArrayList todosPersonajes = new ArrayList();
    
    for(int i=0; i < this.getJugadores().size(); i++){
      Jugador jugador = (Jugador) this.getJugadores().get(i);
      todosPersonajes.addAll(jugador.getPersonajes());
    }
    
    return todosPersonajes;
  }
  
  boolean quedaSoloUnJugadorVivo(){
    return false;
  }
}


class Jugador{
  String nombre;
  color miColor;
  Juego miJuego;
  
  ArrayList personajes = new ArrayList();
  color [] Colores = {color(255,0,0),color(0,255,0),color(0,0,255)};
  
  Jugador(String nombre, int miColor){
    this.nombre = nombre;
    this.miColor = this.Colores[miColor];
  }
  
  void addPersonaje(Personaje unPersonaje){
    unPersonaje.setJugador(this);
    personajes.add(unPersonaje);
  }
  
  color getColor(){
    return this.miColor;
  }
  
  ArrayList getPersonajes(){
    return this.personajes;
  }
  
  void setJuego2Personajes(Juego miJuego){
    for(int i=0; i < this.getPersonajes().size(); i++){
        Personaje personaje = (Personaje) this.getPersonajes().get(i);
        personaje.setJuego(miJuego);
      }
  }
  
  void drawPersonajes(){
       for(int i=0; i < this.getPersonajes().size(); i++){
        Personaje personaje = (Personaje) this.getPersonajes().get(i);
        personaje.draw();
      }
  }
  
  void setJuego(Juego miJuego){
    this.miJuego = miJuego;
  }
  
}



class Personaje {
  float ataque;
  float defensa;
  int maxVida = 50;
  int vida = 50;
  int distanciaAtaque;
  float posX, posY;
  Jugador miJugador;
  Juego miJuego;
  Personaje miEnemigoCercano;

  boolean vivo = true;

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Personaje() {
    this.location = new PVector(random(0, width), random(0, height));
    this.velocity = new PVector(0, 0);
    this.topspeed = 0.5;
  }

  void setJugador(Jugador miJugador) {
    this.miJugador = miJugador;
  }

  Jugador getJugador() {
    return this.miJugador;
  }

  color getColor() {
    /*
    float r = (red(this.miJugador.getColor()) != 0) ? map(this.vida,this.maxVida,0,255,0) : 0;
    float g = (green(this.miJugador.getColor()) != 0) ? map(this.vida,this.maxVida,0,255,0) : 0;
    float b = (blue(this.miJugador.getColor()) != 0) ? map(this.vida,this.maxVida,0,255,0) : 0;
    */
    return this.miJugador.getColor();
  }

  void actualizarPosicion() {

    // Compute a vector that points from location to mouse
    PVector posEnemigo = this.getPosEnemigo();
    PVector acceleration = PVector.sub(posEnemigo, this.location);
    // Set magnitude of acceleration
    acceleration.setMag(0.3);

    // Velocity changes according to acceleration
    this.velocity.add(acceleration);
    // Limit the velocity by topspeed
    this.velocity.limit(this.topspeed);
    // Location changes by velocity
    this.location.add(this.velocity);

    this.posX = location.x;
    this.posY = location.y;
  }

  void draw() {
    if (this.isVivo()){
      this.actualizarPosicion();
      this.atacar(this.miEnemigoCercano);
    }
  }

  void setJuego(Juego miJuego) {
    this.miJuego = miJuego;
  }

  Juego getJuego() {
    return this.miJuego;
  }

  boolean isEnemigo(Personaje unPersonaje) {
    return this.getJugador().nombre != unPersonaje.getJugador().nombre;
  } 

  ArrayList getEnemigos() {
    ArrayList todosPersonajes = this.getJuego().getTodosPersonajes();
    ArrayList enemigos = new ArrayList();

    for (int i=0; i < todosPersonajes.size(); i++) {
      Personaje personaje = (Personaje) todosPersonajes.get(i);
      if (personaje.isEnemigo(this) && personaje.isVivo()) {
        enemigos.add(personaje);
      }
    }

    return enemigos;
  }

  PVector getPosEnemigo() {
    ArrayList enemigos = this.getEnemigos();
    float maxDist = 99999;

    for (int i=0; i < enemigos.size(); i++) {
      Personaje personaje = (Personaje) enemigos.get(i);
      float distancia = dist(personaje.posX, personaje.posY, this.posX, this.posY);

      if (distancia < maxDist) {
        maxDist = distancia;
        this.miEnemigoCercano = personaje;
      }
    }

    return new PVector(this.miEnemigoCercano.posX, this.miEnemigoCercano.posY);
  }

  void atacar(Personaje unPersonaje) {
    if(dist(this.posX,this.posY,unPersonaje.posX,unPersonaje.posY) < this.distanciaAtaque){
      unPersonaje.atacado(this.ataque);
    }
  }

  void atacado(float puntosDeAtaque) {
    this.vida -= puntosDeAtaque;

    if (this.vida <= 0) {
      this.morir();
    }
  }

  void morir() {
    this.vivo = false;
  }

  boolean isVivo() {
    return this.vivo;
  }
}
