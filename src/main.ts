import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const port = process.env.PORT || 3000; // Pega do .env ou usa 3000 por padrão
  await app.listen(port);
  console.log(`🚀 Aplicação rodando na porta ${port}`);
}
bootstrap();
