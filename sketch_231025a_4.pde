PFont fuente;
String onomatopeya = "POM!";
float tamañoTexto = 12;
int numAnillos = 4;
int letrasPorAnillo = 10;
float radioInicial = 40;
float espacioAnillo = 60;
int cuadroActual = 0;

void setup() {
  size(420, 595);
  fuente = createFont("Arial", 12);
  textFont(fuente);
  background(255);
  fill(0);
  textAlign(CENTER);
  text(onomatopeya, width/2, height/2);
  frameRate(40); 
}

void draw() {
  if (cuadroActual < 6) {
    textSize(12);
    for (int i = 0; i < numAnillos; i++) {
      float radio = radioInicial + i * espacioAnillo;
      for (int j = 0; j < letrasPorAnillo; j++) {
        float ánguloAleatorio = radians(j * (360.0 / letrasPorAnillo)) + random(-PI/4, PI/4);
        float radioAleatorio = random(10, 20);
        float x = width / 2 + cos(ánguloAleatorio) * (radio + radioAleatorio);
        float y = height / 2 + sin(ánguloAleatorio) * (radio + radioAleatorio);
        char letra = onomatopeya.charAt(j % onomatopeya.length());
        mostrarLetra(x, y, tamañoTexto, letra);
      }
    }
  }
}

void mouseMoved() {
  redraw();
}

void mostrarLetra(float x, float y, float tamañoTexto, char letra) {
  textSize(tamañoTexto);
  text(letra, x, y);
}
