# Event Countdown

Um aplicativo iOS elegante e intuitivo para gerenciar e acompanhar eventos futuros, desenvolvido em SwiftUI.

## 📱 Funcionalidades

- Adicionar eventos com título personalizado
- Definir data e hora do evento
- Personalizar cor do texto para cada evento
- Visualização em tempo real da contagem regressiva
- Editar eventos existentes
- Excluir eventos
- Ordenação automática por data
- Interface limpa e moderna

## 🛠️ Tecnologias Utilizadas

- Swift 5
- SwiftUI
- Xcode 15+
- iOS 17+

## 📚 Explicação do Código

### 1. Modelo de Dados (Event.swift)

```swift
struct Event: Identifiable, Comparable, Hashable {
    var id = UUID()
    var title: String
    var date: Date
    var textColor: Color
}
```

#### Conceitos Importantes:
- `Identifiable`: Protocolo que garante que cada evento tenha um ID único
- `Comparable`: Permite ordenar eventos por data
- `Hashable`: Necessário para usar eventos em coleções como Sets
- `UUID()`: Gera um identificador único universal

### 2. Visualização do Evento (EventRow.swift)

```swift
struct EventRow: View {
    let event: Event
    @State private var relativeTime: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
}
```

#### Conceitos Importantes:
- `@State`: Gerencia o estado da view, atualizando-a quando o valor muda
- `Timer.publish`: Cria um timer que atualiza a contagem regressiva a cada segundo
- `RelativeDateTimeFormatter`: Formata a data em texto relativo (ex: "em 2 dias")

### 3. Formulário de Evento (EventForm.swift)

```swift
struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    @Binding var events: [Event]
}
```

#### Conceitos Importantes:
- `@Environment`: Acessa valores do ambiente SwiftUI (como dismiss)
- `@Binding`: Cria uma referência bidirecional para dados
- `Form`: Container especializado para entrada de dados
- `dismiss()`: Fecha a view modal

### 4. View Principal (EventsView.swift)

```swift
struct EventsView: View {
    @State var events = [Event]()
    @State private var isPresentingNewEventView = false
}
```

#### Conceitos Importantes:
- `NavigationStack`: Gerencia a navegação hierárquica
- `List`: Container para exibir dados em lista
- `ForEach`: Itera sobre coleções de dados
- `onDelete`: Manipula gestos de deleção

## 🔑 Conceitos Fundamentais do SwiftUI

### Gerenciamento de Estado
- `@State`: Para valores simples que pertencem a uma view
- `@Binding`: Para compartilhar estado entre views
- `@Environment`: Para acessar valores do ambiente

### Ciclo de Vida
- `onAppear`: Executado quando a view aparece
- `onReceive`: Responde a eventos externos (como Timer)
- `onDelete`: Manipula gestos de deleção

### Navegação
- `NavigationStack`: Container principal de navegação
- `NavigationLink`: Link para navegação
- `sheet`: Apresentação modal

### Layout
- `VStack`: Organização vertical
- `HStack`: Organização horizontal
- `List`: Container de lista
- `Form`: Container de formulário
