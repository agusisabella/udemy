
import 'dart:math' as math;
void main(List<String> arguments) {

  final rawJson ={
    'nombre' :'Tony Stark',
   // 'poder': 'Dinero'
  };
  final wolverine = Heroe(nombre:'Logan',poder:'regeneracion');

  //final ironman = new Heroe( nombre: rawJson['nombre'], poder: rawJson['poder']); esto tira error porque nombre podria no existir en el json
  //final ironman = new Heroe( nombre: rawJson['nombre']!, poder: rawJson['poder']! ); // lo resolvemos de esta forma

  final ironman2 = Heroe.fromJson(rawJson);

  print(wolverine.toString());
  print (ironman2.toString());

final cuadrado = Cuadrado(5);
print(' area ${cuadrado.area}');

  final perro = Perro();
  sonidoAnimal(perro);

}


void sonidoAnimal( Animal animal){

  animal.emitirSonido();

}

class Heroe {
  String? nombre;
  String? poder;
 /*  
  Heroe(  String pNombre, String pPoder ){
    this.nombre = pNombre;
    this.poder = pPoder;

  } */


  Heroe ({
    required this.nombre,
  required this.poder
  });
/*
Heroe.fromJson(Map<String , String> json){   SI NO PONGO LOS : SIGNIFICA QUE PRIMERO SE CREA LA INSTANCIA Y DESPUES SE EJECUTA EL METODO
  this.nombre = json['nombre']!;  // SI LOS ARGUMENTOS SON OBLIGATORIOS ME TIRA ERROR PORQUE AL CREAR LA INSTANCIA YA DEBERIAN EXISTIR
  this.poder = json['poder'] ?? 'no tiene poder' ; // CUANDO INTENTA EJECUTAR ESTO LA INSTANCIA YA FUE CREADA, POR LO TANTO TIRA ERROR

}*/

Heroe.fromJson (Map<String, String> json ):
nombre = json['nombre']?? 'No tiene nombre', 
poder = json['poder']?? 'No tiene poder';


  @override
  String toString(){
    return 'Heroe: nombre: $nombre , poder: $poder ';
  }

}


class Cuadrado{ 

  double lado = 0; 
 
  set area(double valor){
    lado = math.sqrt(valor);
  }

  double get area{
    return lado * lado;
  }

  Cuadrado (double plado):
    lado = plado;

  double calculaArea(){

      return lado * lado;
  }
}

/* CLASES ABSTRACTAS */


abstract class Animal {
  int? pata;

  void emitirSonido();

}


class Perro implements Animal {
  


  @override
  void emitirSonido() {
    print('guau');
  }

  @override
  int? pata;



}





abstract class Personaje {
String? poder;
String? nombre;

Personaje(this.nombre);
@override
String toString(){
  return '$nombre  $poder';
}

}

class Antagonista extends Personaje{

  Antagonista( String nombre): super(nombre);
}






