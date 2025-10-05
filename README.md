# 💬 Real-Time Chat Application Backend
A messaging kind of thingy..

## 🚀 Features

- **Real-Time Messaging**: It works fine

## 🛠️ Tech Stack

- **Java** (17 or higher recommended)
- **Spring Boot** (3.x)
- **Spring WebSocket**
- **STOMP Protocol**
- **SockJS**
- **Maven** (Build tool)

## 📋 Prerequisites

Before running this application, make sure you have:

- Java Development Kit (JDK) 17 or higher
- Maven 3.6+
- Your favorite IDE (IntelliJ IDEA, Eclipse, or VS Code)

## 🔧 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/EthicalAniruddha/chat-backend.git
   cd chat-backend
   ```

2. **Build the project**
   ```bash
   mvn clean install
   ```

3. **Run the application**
   ```bash
   mvn spring-boot:run
   ```

The application will start on `http://localhost:8080` by default.

4. **Here is the app link:** `https://chat-backend-ln0x.onrender.com/` if you are lucky it will be live

## 📡 API Endpoints

### WebSocket Endpoints

- **WebSocket Connection**: `/chat`
  - Establishes WebSocket connection using SockJS

### Message Endpoints

- **Send Message**: `/app/sendMessage`
  - Send a chat message to all connected users
  - Payload format:
    ```json
    {
      "sender": "username",
      "content": "message content"
    }
    ```

### Subscription Topics

- **Receive Messages**: `/topic/messages`
  - Subscribe to receive broadcast messages from all users

## 💡 Usage Example

### Client-Side Connection (JavaScript)

```javascript
// Establish connection
var socket = new SockJS('http://localhost:8080/chat');
var stompClient = Stomp.over(socket);

// Connect to the server
stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    
    // Subscribe to messages
    stompClient.subscribe('/topic/messages', function(message) {
        var chatMessage = JSON.parse(message.body);
        console.log(chatMessage.sender + ': ' + chatMessage.content);
    });
});

// Send a message
function sendMessage() {
    var chatMessage = {
        sender: 'John',
        content: 'Hello everyone!'
    };
    stompClient.send("/app/sendMessage", {}, JSON.stringify(chatMessage));
}
```

## 📁 Project Structure

```
chat-backend/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── chat/app/
│   │   │           ├── config/
│   │   │           │   └── WebSocketConfig.java
│   │   │           ├── controller/
|   |   |           |   └── HomeController.java
│   │   │           │   └── ChatController.java
│   │   │           ├── model/
│   │   │           │   └── ChatMessage.java
│   │   │           └── AppApplication.java
│   │   └── resources/
|   |       |── templates/
            |      └── chat.html
│   │       └── application.properties
│   └── test/
├── pom.xml
└── README.md
```

## ⚙️ Configuration

### Application Properties

Configure the application in `src/main/resources/application.properties`:

```properties
# Server Configuration
server.port=8080

# CORS Configuration (if needed)
# Add allowed origins for your frontend application
```

### CORS Configuration

If you need to enable CORS for your frontend application, update the WebSocket configuration to allow specific origins.

## 🔐 Security Considerations

For production deployment, consider implementing:

- User authentication and authorization
- JWT token-based security
- Rate limiting
- Message encryption
- Input validation and sanitization

## 🧪 Testing

Run tests using Maven:

```bash
mvn test
```

## 📦 Building for Production

Create a production-ready JAR file:

```bash
mvn clean package
```

The JAR file will be generated in the `target/` directory.

Run the JAR:

```bash
java -jar target/chat-backend-0.0.1-SNAPSHOT.jar
```

## 🐳 Docker Support (Optional)

Create a `Dockerfile`:

```dockerfile
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

Build and run:

```bash
docker build -t chat-backend .
docker run -p 8080:8080 chat-backend
```

## 🌐 Frontend Integration

This backend works seamlessly with WebSocket-enabled frontend applications. For a ready-to-use frontend example, check out the [frontend repository](#) or use the provided HTML/JavaScript client.

### Required Frontend Libraries

- SockJS Client: `sockjs-client@1`
- STOMP.js: `stomp.js@2.3.1`

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Aniruddha**
- GitHub: [@EthicalAniruddha](https://github.com/EthicalAniruddha)

## 🙏 Acknowledgments

- Spring Framework team for excellent WebSocket support
- STOMP Protocol for simple messaging implementation
- SockJS for WebSocket fallback capabilities

## 📞 Support

If you have any questions or run into issues, please open an issue on GitHub.

---

⭐ If you find this project helpful, please consider giving it a star!

## 🔗 Related Links

- [Spring WebSocket Documentation](https://spring.io/guides/gs/messaging-stomp-websocket/)
- [STOMP Protocol Specification](https://stomp.github.io/)
- [SockJS Documentation](https://github.com/sockjs/sockjs-client)
