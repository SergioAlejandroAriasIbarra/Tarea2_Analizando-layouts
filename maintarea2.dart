import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'My App',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Tarea 2'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 52, 84),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hourly forecast",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Container(
                  margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  height: 120,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color.fromARGB(255, 4, 29, 53)),
                  child: Center(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: datos.length,
                        itemBuilder: (context, index) {
                          return TemperatureWidget(
                            hora: datos[index]["hora"]!,
                            temperatura: datos[index]["temperatura"]!,
                            icono: datos[index]["icono"]!,
                          );
                        }),
                  ),
                ),
                Text("10-day forecast",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: datos2.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Día: ${datos2[index]["dia"]!} -- Temperatura: ${datos2[index]["temperatura"]!}'),
                          ));
                        },
                        child: DayWidget(
                          dia: datos2[index]["dia"]!,
                          temperatura: datos2[index]["temperatura"]!,
                          icono: datos2[index]["icono"]!,
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  final String hora;
  final String temperatura;
  final String icono;

  const TemperatureWidget({
    Key? key,
    required this.hora,
    required this.temperatura,
    required this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Hora
          Text(
            temperatura,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          // Icono
          Image.network(
            icono,
            width: 20,
            height: 20,
          ),
          // Temperatura
          Text(
            hora,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final String dia;
  final String temperatura;
  final String icono;

  const DayWidget({
    Key? key,
    required this.dia,
    required this.temperatura,
    required this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 30,
        width: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromARGB(255, 4, 29, 53)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Hora
            Text(
              dia,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(width: 10),
            // Icono
            Image.network(
              icono,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
            // Temperatura
            Text(
              temperatura,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> datos = [
  {
    "hora": "11:52",
    "temperatura": "11°",
    "icono": "https://pngimg.com/d/moon_PNG4.png",
  },
  {
    "hora": "12 AM",
    "temperatura": "14°",
    "icono": "https://pngimg.com/d/moon_PNG4.png",
  },
  {
    "hora": "1 AM",
    "temperatura": "14°",
    "icono": "https://pngimg.com/d/moon_PNG4.png",
  },
  {
    "hora": "2 AM",
    "temperatura": "13°",
    "icono": "https://pngimg.com/d/moon_PNG4.png",
  },
  {
    "hora": "3 AM",
    "temperatura": "11°",
    "icono": "https://pngimg.com/d/moon_PNG4.png",
  },
];

List<Map<String, String>> datos2 = [
  {
    "dia": "Hoy",
    "temperatura": "28°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png"
  },
  {
    "dia": "Martes",
    "temperatura": "20°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-filled-outline-3/64/weather07-512.png"
  },
  {
    "dia": "Miércoles",
    "temperatura": "30°",
    "icono": "https://cdn-icons-png.flaticon.com/512/979/979585.png"
  },
  {
    "dia": "Jueves",
    "temperatura": "28°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png"
  },
  {
    "dia": "Viernes",
    "temperatura": "28°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png"
  },
  {
    "dia": "Sábado",
    "temperatura": "29°",
    "icono": "https://cdn-icons-png.flaticon.com/512/979/979585.png"
  },
  {
    "dia": "Domingo",
    "temperatura": "29°",
    "icono": "https://cdn-icons-png.flaticon.com/512/979/979585.png"
  },
  {
    "dia": "Lunes",
    "temperatura": "23°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png"
  },
  {
    "dia": "Martes",
    "temperatura": "20°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-filled-outline-3/64/weather07-512.png"
  },
  {
    "dia": "Miércoles",
    "temperatura": "24°",
    "icono":
        "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png"
  }
];
