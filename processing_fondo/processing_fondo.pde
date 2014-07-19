import oscP5.*;
import netP5.*;

OscP5 oscP5;

float colorf, fondo;

void setup() {
  size(displayWidth, displayHeight);

  oscP5 = new OscP5(this, 12000);
  noCursor();
}


void draw() {
  if (fondo > 20) {
    background(fondo);
  } else {
    background(0);
  }


  fondo = map(colorf, 0.0029, 0.004, 0, 255);

  println(fondo);
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/f")==true) { // si la dirección es "pitch"
    if (theOscMessage.checkTypetag("f")) { // si el dato que trae el mensaje es un float
      colorf = theOscMessage.get(0).floatValue(); // extraemos el primer dato (0) y se lo asignamos al pitch
      //println(colorf);
      return;
    }
  }
}

