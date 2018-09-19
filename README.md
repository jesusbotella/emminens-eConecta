# emminens eConecta Uploader API
API reference for emminens eConecta Uploader. This project intends to provide a description of the endpoint that eConecta platform uses to receive data from glucose meters and pumps.

Use it for educational purposes only.


API Reference
--

### Upload Data [/uploader/rest/upload]
```
POST https://esurveys.emminens-healthcare.com/uploader/rest/upload
```

+ **Request** (application/json)
  + **Attributes** (object)
    + csvGlucose (Base64 string) - Base64 encoded string of your glucose CSV file
    + password (string) - Password
    + patientId (number) - Patient ID
    + userId (number) - User ID
    + xmlGlucose (Base64 string) - Base64 encoded string of your glucose XML file
    + xmlPump (Base64 string) - Base64 encoded string of your pump data CSV file

    Credential values can be obtained by inspecting uploader page source in emminens eConecta platform.

  + **Body**
    ```
    {
      csvGlucose: "",
      password: "XXXXXXXXXXXXX",
      patientId: 00000,
      userId: 00000,
      xmlGlucose: "",
      xmlPump: ""
    }
    ```

+ **OK** · Response 200 (application/json)
    + **Body**
      ```
      {
          "result": "OK",
          "messages": [],
          "additionalData": {
              "modelName": "",
              "idPaciente": 00000,
              "correctionFactor": 0,
              "newGlucoseMeasurements": 0,
              "tipoMedidor": 0,
              "idMedidor": 00000
          }
      }
      ```

+ **Unauthorized** · Response 200 (application/json)
    + **Body**
      ```
      {
          "result": "NOK",
          "messages": [
              "msm.applet.error.authorizationFailed"
          ],
          "additionalData": {
              "modelName": "",
              "idPaciente": null,
              "correctionFactor": null,
              "newGlucoseMeasurements": null,
              "tipoMedidor": null,
              "idMedidor": null
          }
      }
      ```

Glucose and Pump Data
--
Both Glucose and Pump XML files can be obtained from SmartPix device when connecting it to the computer to send data in eConecta Web Uploader.

+ **XML Glucose File**: [Example](https://github.com/jesusbotella/emminens-nightscout/blob/master/example_files/glucose.xml) · [Template](https://github.com/jesusbotella/emminens-nightscout/blob/master/xml_templates/ACSPIXMT.XSL)
+ **XML Pump File**: [Example](https://github.com/jesusbotella/emminens-nightscout/blob/master/example_files/pump.xml) · [Template](https://github.com/jesusbotella/emminens-nightscout/blob/master/xml_templates/ACSPIXIP.XSL)
